<div class="pull-right">
	<a href="<?php echo site_url('colaboradore/add'); ?>" class="btn btn-success">Add</a> 
</div>

<table class="table table-striped table-bordered">
    <tr>
		<th>ID</th>
		<th>Cpf</th>
		<th>Senha</th>
		<th>Email</th>
		<th>Telefone</th>
		<th>Actions</th>
    </tr>
	<?php foreach($colaboradores as $c){ ?>
    <tr>
		<td><?php echo $c['id']; ?></td>
		<td><?php echo $c['cpf']; ?></td>
		<td><?php echo $c['senha']; ?></td>
		<td><?php echo $c['email']; ?></td>
		<td><?php echo $c['telefone']; ?></td>
		<td>
            <a href="<?php echo site_url('colaboradore/edit/'.$c['id']); ?>" class="btn btn-info btn-xs">Edit</a> 
            <a href="<?php echo site_url('colaboradore/remove/'.$c['id']); ?>" class="btn btn-danger btn-xs">Delete</a>
        </td>
    </tr>
	<?php } ?>
</table>
<div class="pull-right">
    <?php echo $this->pagination->create_links(); ?>    
</div>
