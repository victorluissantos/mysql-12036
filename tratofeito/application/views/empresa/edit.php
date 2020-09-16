<?php echo form_open('empresa/edit/'.$empresa['id'],array("class"=>"form-horizontal")); ?>

	<div class="form-group">
		<label for="cnpj" class="col-md-4 control-label"><span class="text-danger">*</span>Cnpj</label>
		<div class="col-md-8">
			<input type="text" name="cnpj" value="<?php echo ($this->input->post('cnpj') ? $this->input->post('cnpj') : $empresa['cnpj']); ?>" class="form-control" id="cnpj" />
			<span class="text-danger"><?php echo form_error('cnpj');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="senha" class="col-md-4 control-label"><span class="text-danger">*</span>Senha</label>
		<div class="col-md-8">
			<input type="text" name="senha" value="<?php echo ($this->input->post('senha') ? $this->input->post('senha') : $empresa['senha']); ?>" class="form-control" id="senha" />
			<span class="text-danger"><?php echo form_error('senha');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="email" class="col-md-4 control-label">Email</label>
		<div class="col-md-8">
			<input type="text" name="email" value="<?php echo ($this->input->post('email') ? $this->input->post('email') : $empresa['email']); ?>" class="form-control" id="email" />
			<span class="text-danger"><?php echo form_error('email');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="telefone" class="col-md-4 control-label">Telefone</label>
		<div class="col-md-8">
			<input type="text" name="telefone" value="<?php echo ($this->input->post('telefone') ? $this->input->post('telefone') : $empresa['telefone']); ?>" class="form-control" id="telefone" />
			<span class="text-danger"><?php echo form_error('telefone');?></span>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-8">
			<button type="submit" class="btn btn-success">Save</button>
        </div>
	</div>
	
<?php echo form_close(); ?>