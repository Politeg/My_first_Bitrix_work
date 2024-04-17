<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>

<?if (!empty($arResult)):?>
    <div class="sb_sidebar">
        <div class="sb_nav">
            <ul>

                <?
                foreach($arResult as $arItem):
                    if($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1)
                        continue;
                    ?>
                    <?if($arItem["SELECTED"]):?>
                    <span class="sb_showchild"></span>
                    <li class="close"><a href="<?=$arItem["LINK"]?>"><span><?=$arItem["TEXT"]?></span></a></li>
                <?else:?>
                    <li class="close"><a href="<?=$arItem["LINK"]?>"><span><?=$arItem["TEXT"]?></span></a></li>
                <?endif?>

                <?endforeach?>

            </ul>
        </div>
    </div>
<?endif?>
