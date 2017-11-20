<u><?php echo $category; ?></u>
<table class="tablesorter">
<thead>
	<tr>
		<?php foreach ($result->list_fields() as $fields): ?>
			<th><?php echo ucfirst($fields);?></th>
		<?php endforeach; ?>
	</tr>
</thead>

<tbody>
<?php foreach ($result->result_array() as $row): ?>
	<tr>
	<?php foreach ($row as $key => $value): ?>
		<td><?php echo $value;?></td>
	<?php endforeach; ?>
	</tr>
<?php endforeach; ?>

</tbody>
</table>
