<?php
declare(strict_types=1);

use Manager\ManagerModel;
use Rbac\RoleModel;

class Rbac_Manager_RoleController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'manager_id'],
        ['field' => 'role_id'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}