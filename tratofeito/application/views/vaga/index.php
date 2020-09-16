<div class="pull-right">
	<a href="<?php echo site_url('vaga/add'); ?>" class="btn btn-success">Add</a> 
</div>

<table class="table table-striped table-bordered">
    <tr>
		<th>ID</th>
		<th>Empresas Id</th>
		<th>Titulo</th>
		<th>Descritivo</th>
		<th>Actions</th>
    </tr>
	<?php foreach($vagas as $v){ ?>
    <tr>
		<td><?php echo $v['id']; ?></td>
		<td><?php echo $v['empresas_id']; ?></td>
		<td><?php echo $v['titulo']; ?></td>
		<td><?php echo $v['descritivo']; ?></td>
		<td>
            <a href="<?php echo site_url('vaga/edit/'.$v['id']); ?>" class="btn btn-info btn-xs">Edit</a> 
            <a href="<?php echo site_url('vaga/remove/'.$v['id']); ?>" class="btn btn-danger btn-xs">Delete</a>
        </td>
    </tr>
	<?php } ?>
</table>
<div class="pull-right">
    <?php echo $this->pagination->create_links(); ?>    
</div>
