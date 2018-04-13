<?php
$this->load->view('templates/FHC-Header', array(
	'title' => 'Datenexport',
	'jquery' => true,
	'jqueryui' => true,
	'bootstrap' => true,
	'fontawesome' => true,
	'sbadmintemplate' => true));
?>
<body>
<div id="wrapper">
	<?php
	echo $this->widgetlib->widget('NavigationWidget');
	?>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Übersicht - Anonymisierung</h3>
				</div>
			</div>
			<?php
			foreach($jobs as $job):
				if($job->anzahl<=0)
					$panelclass = 'panel-green';
				elseif($job->anzahl<100)
					$panelclass = 'panel-yellow';
				else
					$panelclass = 'panel-red';
			?>
				<div class="col-lg-3 col-md-6">
					<div class="panel <?php echo $panelclass;?>">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge"><?php echo $job->anzahl; ?></div>
									<div><?php echo $job->anonymisierung_kurzbz; ?></div>
								</div>
							</div>
						</div>
						<a href="<?php echo site_url('extensions/FHC-Core-DSMS/Export/Details/').$job->anonymisierung_kurzbz;?>">
							<div class="panel-footer">
								<span class="pull-left">View Details</span>
								<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			<?php
			endforeach;
			?>
		</div>
	</div>
</div>

</body>
<?php
$this->load->view('templates/FHC-Footer');
?>
