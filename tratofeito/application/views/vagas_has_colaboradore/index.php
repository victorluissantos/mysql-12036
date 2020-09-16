<div class="pull-right">
	<a href="<?php echo site_url('vagas_has_colaboradore/add'); ?>" class="btn btn-success">Add</a> 
</div>

<table class="table table-striped table-bordered">
    <tr>
		<th>Vagas Id</th>
		<th>Colaboradores Id</th>
		<th>Actions</th>
    </tr>
	<?php foreach($vagas_has_colaboradores as $v){ ?>
    <tr>
		<td><?php echo $v['vagas_id']; ?></td>
		<td><?php echo $v['colaboradores_id']; ?></td>
		<td>
            <a href="<?php echo site_url('vagas_has_colaboradore/edit/'.$v['vagas_id']); ?>" class="btn btn-info btn-xs">Edit</a> 
            <a href="<?php echo site_url('vagas_has_colaboradore/remove/'.$v['vagas_id']); ?>" class="btn btn-danger btn-xs">Delete</a>
        </td>
    </tr>
	<?php } ?>
</table>
<div class="pull-right">
    <?php echo $this->pagination->create_links(); ?>    
</div>
