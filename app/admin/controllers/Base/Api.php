<?php
declare(strict_types=1);

namespace Base;
use Yaf\Dispatcher;

abstract class ApiController extends AbstractController
{
    public function init()
    {
        parent::init();
        Dispatcher::getInstance()->autoRender(false);
        $this->_request->setParam('version', $this->_request->action)->setActionName($this->_request->method);
        $this->model = (str_replace('_', '\\', $this->_request->controller).'Model')::getInstance($this->id);
    }

    protected function postAction()
    {
        return $this->send($this->model->post());
    }

    protected function deleteAction()
    {
        return $this->send($this->model->delete());
    }

    protected function putAction()
    {
        return $this->send($this->model->put());
    }

    protected function getAction()
    {
        return $this->send($this->model->get());
    }
}