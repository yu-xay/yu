<?php

declare(strict_types=1);

namespace DesignMode\Structural\DependencyInjection;

class DatabaseConnection
{
    //依赖注入
    private DatabaseConfiguration $configuration;

    public function __construct(DatabaseConfiguration $config)
    {
        $this->configuration = $config;
    }

    public function getDsn(): string
    {
        // 这只是为了演示，而不是真正的DSN
        // 请注意，此处仅使用注入的配置，因此有
        // 这里真正的关注点分离

        return sprintf('%s:%s@%s:%d', $this->configuration->getUsername(), $this->configuration->getPassword(), $this->configuration->getHost(), $this->configuration->getPort());
    }
}
