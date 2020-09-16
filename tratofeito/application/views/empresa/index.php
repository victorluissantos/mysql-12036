<div class="pull-right">
	<a href="<?php echo site_url('empresa/add'); ?>" class="btn btn-success">Add</a> 
</div>

<table class="table table-striped table-bordered">
    <tr>
		<th>ID</th>
		<th>Cnpj</th>
		<th>Senha</th>
		<th>Email</th>
		<th>Telefone</th>
		<th>Actions</th>
    </tr>
	<?php foreach($empresas as $e){ ?>
    <tr>
		<td><?php echo $e['id']; ?></td>
		<td><?php echo $e['cnpj']; ?></td>
		<td><?php echo $e['senha']; ?></td>
		<td><?php echo $e['email']; ?></td>
		<td><?php echo $e['telefone']; ?></td>
		<td>
            <a href="<?php echo site_url('empresa/edit/'.$e['id']); ?>" class="btn btn-info btn-xs">Edit</a> 
            <a href="<?php echo site_url('empresa/remove/'.$e['id']); ?>" class="btn btn-danger btn-xs">Delete</a>
        </td>
    </tr>
	<?php } ?>
</table>
<div class="pull-right">
    <?php echo $this->pagination->create_links(); ?>    
</div>
