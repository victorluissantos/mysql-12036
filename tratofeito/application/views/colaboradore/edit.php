<?php echo form_open('colaboradore/edit/'.$colaboradore['id'],array("class"=>"form-horizontal")); ?>

	<div class="form-group">
		<label for="cpf" class="col-md-4 control-label"><span class="text-danger">*</span>Cpf</label>
		<div class="col-md-8">
			<input type="text" name="cpf" value="<?php echo ($this->input->post('cpf') ? $this->input->post('cpf') : $colaboradore['cpf']); ?>" class="form-control" id="cpf" />
			<span class="text-danger"><?php echo form_error('cpf');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="senha" class="col-md-4 control-label"><span class="text-danger">*</span>Senha</label>
		<div class="col-md-8">
			<input type="text" name="senha" value="<?php echo ($this->input->post('senha') ? $this->input->post('senha') : $colaboradore['senha']); ?>" class="form-control" id="senha" />
			<span class="text-danger"><?php echo form_error('senha');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="email" class="col-md-4 control-label">Email</label>
		<div class="col-md-8">
			<input type="text" name="email" value="<?php echo ($this->input->post('email') ? $this->input->post('email') : $colaboradore['email']); ?>" class="form-control" id="email" />
			<span class="text-danger"><?php echo form_error('email');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="telefone" class="col-md-4 control-label">Telefone</label>
		<div class="col-md-8">
			<input type="text" name="telefone" value="<?php echo ($this->input->post('telefone') ? $this->input->post('telefone') : $colaboradore['telefone']); ?>" class="form-control" id="telefone" />
			<span class="text-danger"><?php echo form_error('telefone');?></span>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-8">
			<button type="submit" class="btn btn-success">Save</button>
        </div>
	</div>
	
<?php echo form_close(); ?>