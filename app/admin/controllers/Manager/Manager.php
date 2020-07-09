<?php
declare(strict_types=1);

class Manager_ManagerController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'app_id'],
        ['field' => 'user'],
        ['field' => 'email'],
        ['field' => 'phone'],
        ['field' => 'firstname'],
        ['field' => 'lastname'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}