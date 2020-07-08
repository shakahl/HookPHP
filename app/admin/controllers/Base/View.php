<?php
declare(strict_types=1);

namespace Base;

use MenuModel;

abstract class ViewController extends AbstractController
{
    public function init()
    {
        parent::init();
        $this->_view->setScriptPath(APP_CONFIG['application']['directory'].($this->_request->module === 'Index' ? '' : '/modules/'.$this->_request->module).'/views/'.APP_THEME_NAME);
        $this->_view->assign(
            [
                'title' => l('app.title'),
                'keywords' => l('app.keywords'),
                'description' => l('app.description'),

                'id' => $this->id,
                'languages' => $this->languages,

                'module' => $this->_request->module,
                'controller' => strtolower($this->_request->controller),
                'action' => $this->_request->action,
                'uri' => $this->_request->getRequestUri(),
            ]
        );

        if (isset($_SESSION[APP_NAME])) {
            $this->_view->assign(
                [
                    'menus' => MenuModel::getInstance()->getMenu()
                ]
            );
        }

        // 列表模板渲染
        $this->model = (str_replace('_', '\\', $this->_request->controller).'Model')::getInstance();
        if (isset($this->model)) {
            $cols = [];
            foreach (array_keys(APP_TABLE[$this->model->table]) as $field) {
                $data = [];
                $data['field'] = $field;
                $data['sort'] = true;
                $data['hide'] = false;
                $data['title'] = l($this->_request->controller.'.'.$field);
                if ($field === 'status') {
                    $data['templet'] = '#status';
                }
                if (in_array($field, ['id', 'date_upd'], true)) {
                    $data['fixed'] = 'left';
                }
                if (!in_array($field, ['id', 'status', 'date_add', 'date_upd'], true)) {
                    $data['edit'] = 'text';
                }
                if (in_array($field, ['date_add', 'date_upd'], true)) {
                    $data['templet'] = '<div>{{ layui.util.toDateString(d.'.$field.' * 1000) }}</div>';
                }
                $cols[] = $data;
            }
            $this->_view->assign('cols', $cols);
        }
    }

    protected function postAction()
    {

    }

    protected function putAction()
    {

    }

    protected function getAction()
    {

    }
}