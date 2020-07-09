<?php
declare(strict_types=1);

use Rbac\GroupModel;
use Manager\ManagerModel;

class Rbac_Group_ManagerController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'group_id'],
        ['field' => 'manager_id'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}