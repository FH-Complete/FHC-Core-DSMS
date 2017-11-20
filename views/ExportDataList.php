<?php
foreach ($result->result_array() as $row):
?>
	<br>
		<u><?php echo $category;?></u>
	<?php
	foreach ($row as $key => $value):
		if ($value != ''):
	?>
		<br>
		<b><?php echo ucfirst($key); ?></b>: <?php echo $value;?>
	<?php
		endif;
	endforeach;
endforeach;
?>
