<?php

namespace project;

use components\core\HtmlHead\HtmlHead;
use components\core\WebPage\WebPage;
use components\Lumora\Editor\Editor;
use core\App;
use core\forms\Form;
use core\route\Path;
use core\RouteChasmEnvironment;
use core\sideloader\importers\Css\Css;
use core\sideloader\importers\Javascript\Javascript;
use core\url\Url;
use core\view\ContainerContent;

class Frame extends ContainerContent {
    public const LEXICON_GROUP = 'startuh.frame';

    public static function importAssets(): void {
        Css::import(Editor::getStaticResource("editor.css"));
        Javascript::import(Editor::getStaticResource("inspector.js"));
        Form::importAssets();
    }



    public function __construct() {
        parent::__construct(
            new WebPage(head: new HtmlHead("Frame"))
        );

        $this->setLexiconGroup(self::LEXICON_GROUP);
    }



    public function loadWidgets(string $widgetsDirectory): void {
        foreach (glob(Path::join($widgetsDirectory, '*.js')) as $widget) {
            Javascript::import($widget);
        }

        foreach (glob(Path::join($widgetsDirectory, '*.css')) as $widget) {
            Css::import($widget);
        }
    }

    public function getImage(string $image): string {
        return App::getInstance()
            ->getRequest()
            ->getDomain()
            ->createUrl(Path::from("/public/images/$image"))
            ->toString();
    }

    public function getProjectUrl(): ?Url {
        $request = App::getInstance()
            ->getRequest();

        return $request->getDomain()->createUrl()
            ->setQuery($request->getUrl()->getQuery());
    }

    public function getProjectName(): string {
        return App::getEnvStatic()
            ->get(RouteChasmEnvironment::ENV_PROJECT) ?? 'RouteChasm';
    }
}