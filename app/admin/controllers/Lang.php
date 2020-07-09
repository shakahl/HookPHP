<?php
declare(strict_types=1);

class LangController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'iso'],
        ['field' => 'lang'],
        ['field' => 'name'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}