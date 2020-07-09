<?php
declare(strict_types=1);

use Rbac\{GroupModel, RoleModel};

class Rbac_Group_RoleController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'group_id'],
        ['field' => 'role_id'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}