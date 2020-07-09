<?php
declare(strict_types=1);

class TranslationController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'from'],
        ['field' => 'to'],
        ['field' => 'crc32'],
        ['field' => 'key'],
        ['field' => 'data'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}