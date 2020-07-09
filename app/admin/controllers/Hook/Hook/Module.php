<?php
declare(strict_types=1);

class Hook_Hook_ModuleController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'hook_id'],
        ['field' => 'module_id'],
        ['field' => 'position'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}