<?php
declare(strict_types=1);

class Rbac_GroupController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'name'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}