<?php
declare(strict_types=1);

class ThemeController extends Base\ApiController
{
    public function getAction()
    {
        $data = $this->model->get();
        foreach ($data as &$v) {
            $v['status'] = l('status.'.$v['status']);
        }
        return $this->send($data);
    }
}