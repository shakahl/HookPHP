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
                'controller' => $this->_request->controller,
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
        if (isset($this->cols)) {
            foreach ($this->cols as &$cols) {
                $cols['sort'] = true;
                $cols['hide'] = false;
                $cols['title'] = l($this->_request->controller.'.'.$cols['field']);
                if ($cols['field'] === 'status') {
                    $cols['templet'] = '#status';
                }
                if (!in_array($cols['field'], ['id', 'status', 'date_add', 'date_upd'], true)) {
                    $cols['edit'] = 'text';
                }
                if (in_array($cols['field'], ['date_add', 'date_upd'], true)) {
                    $cols['unresize'] = true;
                    $cols['templet'] = '<div>{{ layui.util.toDateString(d.'.$cols['field'].' * 1000) }}</div>';
                }
            }
            $this->_view->assign('cols', $this->cols);
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
        $this->_view->display('list.phtml');
        return false;
    }
}