<?php echo form_open('vaga/add',array("class"=>"form-horizontal")); ?>

	<div class="form-group">
		<label for="empresas_id" class="col-md-4 control-label"><span class="text-danger">*</span>Empresa</label>
		<div class="col-md-8">
			<select name="empresas_id" class="form-control">
				<option value="">select empresa</option>
				<?php 
				foreach($all_empresas as $empresa)
				{
					$selected = ($empresa['id'] == $this->input->post('empresas_id')) ? ' selected="selected"' : "";

					echo '<option value="'.$empresa['id'].'" '.$selected.'>'.$empresa['id'].'</option>';
				} 
				?>
			</select>
			<span class="text-danger"><?php echo form_error('empresas_id');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="titulo" class="col-md-4 control-label"><span class="text-danger">*</span>Titulo</label>
		<div class="col-md-8">
			<input type="text" name="titulo" value="<?php echo $this->input->post('titulo'); ?>" class="form-control" id="titulo" />
			<span class="text-danger"><?php echo form_error('titulo');?></span>
		</div>
	</div>
	<div class="form-group">
		<label for="descritivo" class="col-md-4 control-label">Descritivo</label>
		<div class="col-md-8">
			<textarea name="descritivo" class="form-control" id="descritivo"><?php echo $this->input->post('descritivo'); ?></textarea>
			<span class="text-danger"><?php echo form_error('descritivo');?></span>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-8">
			<button type="submit" class="btn btn-success">Save</button>
        </div>
	</div>

<?php echo form_close(); ?>