<?php
declare(strict_types=1);

use Rbac\RoleModel;

class Rbac_IndexController extends Base\ViewController
{
    protected function renderForm(): void
    {
        parent::renderForm();
        $this->form['fields']['data'][0]['form']['input']['role_id'] = [
            'type' => 'select',
            'name' => 'role_id',
            'label' => l($this->_request->controller.'.role_id'),
            'lang' => false,
            'values' => [['options' => RoleModel::getInstance($this->id)->getSelect()]]
        ];
        $this->form['fields']['data'][0]['form']['input']['type'] = [
            'type' => 'select',
            'name' => 'type',
            'label' => l($this->_request->controller.'.type'),
            'lang' => false,
            'values' => [['options' => l($this->_request->controller.'.typeSelect')]]
        ];
    }
}