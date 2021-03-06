<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Vaga extends CI_Controller{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Vaga_model');
    } 

    /*
     * Listing of vagas
     */
    function index()
    {
        $params['limit'] = RECORDS_PER_PAGE; 
        $params['offset'] = ($this->input->get('per_page')) ? $this->input->get('per_page') : 0;
        
        $config = $this->config->item('pagination');
        $config['base_url'] = site_url('vaga/index?');
        $config['total_rows'] = $this->Vaga_model->get_all_vagas_count();
        $this->pagination->initialize($config);

        $data['vagas'] = $this->Vaga_model->get_all_vagas($params);
        
        $data['_view'] = 'vaga/index';
        $this->load->view('layouts/main',$data);
    }

    /*
     * Adding a new vaga
     */
    function add()
    {   
        $this->load->library('form_validation');

		$this->form_validation->set_rules('empresas_id','Empresas Id','required');
		$this->form_validation->set_rules('titulo','Titulo','required|max_length[60]');
		$this->form_validation->set_rules('descritivo','Descritivo','max_length[450]');
		
		if($this->form_validation->run())     
        {   
            $params = array(
				'empresas_id' => $this->input->post('empresas_id'),
				'titulo' => $this->input->post('titulo'),
				'descritivo' => $this->input->post('descritivo'),
            );
            
            $vaga_id = $this->Vaga_model->add_vaga($params);
            redirect('vaga/index');
        }
        else
        {
			$this->load->model('Empresa_model');
			$data['all_empresas'] = $this->Empresa_model->get_all_empresas();
            
            $data['_view'] = 'vaga/add';
            $this->load->view('layouts/main',$data);
        }
    }  

    /*
     * Editing a vaga
     */
    function edit($id)
    {   
        // check if the vaga exists before trying to edit it
        $data['vaga'] = $this->Vaga_model->get_vaga($id);
        
        if(isset($data['vaga']['id']))
        {
            $this->load->library('form_validation');

			$this->form_validation->set_rules('empresas_id','Empresas Id','required');
			$this->form_validation->set_rules('titulo','Titulo','required|max_length[60]');
			$this->form_validation->set_rules('descritivo','Descritivo','max_length[450]');
		
			if($this->form_validation->run())     
            {   
                $params = array(
					'empresas_id' => $this->input->post('empresas_id'),
					'titulo' => $this->input->post('titulo'),
					'descritivo' => $this->input->post('descritivo'),
                );

                $this->Vaga_model->update_vaga($id,$params);            
                redirect('vaga/index');
            }
            else
            {
				$this->load->model('Empresa_model');
				$data['all_empresas'] = $this->Empresa_model->get_all_empresas();

                $data['_view'] = 'vaga/edit';
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The vaga you are trying to edit does not exist.');
    } 

    /*
     * Deleting vaga
     */
    function remove($id)
    {
        $vaga = $this->Vaga_model->get_vaga($id);

        // check if the vaga exists before trying to delete it
        if(isset($vaga['id']))
        {
            $this->Vaga_model->delete_vaga($id);
            redirect('vaga/index');
        }
        else
            show_error('The vaga you are trying to delete does not exist.');
    }
    
}
