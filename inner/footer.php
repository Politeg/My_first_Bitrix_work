</div>
</div>
<div class="sb_sidebar">
    <?$APPLICATION->IncludeComponent(
        "bitrix:menu",
        "left_menu",
        Array(
            "ALLOW_MULTI_SELECT" => "N",
            "CHILD_MENU_TYPE" => "left",
            "COMPONENT_TEMPLATE" => "vertical_multilevel",
            "DELAY" => "N",
            "MAX_LEVEL" => "2",
            "MENU_CACHE_GET_VARS" => "",
            "MENU_CACHE_TIME" => "3600",
            "MENU_CACHE_TYPE" => "N",
            "MENU_CACHE_USE_GROUPS" => "Y",
            "ROOT_MENU_TYPE" => "left",
            "USE_EXT" => "N"
        )
    );?>
    <?php
    if ($APPLICATION->GetCurPage() != "/partners/") { // Проверяем текущую страницу
        // Подключаем включаемую область, если текущая страница не "Партнёрам"
        $APPLICATION->IncludeComponent(
            "bitrix:main.include",
            ".default",
            Array(
                "AREA_FILE_SHOW" => "file",
                "AREA_FILE_SUFFIX" => "/include/events.php",
                "COMPONENT_TEMPLATE" => ".default",
                "EDIT_TEMPLATE" => "",
                "PATH" => "/include/events.php"
            )
        );
    }
    else{
        $APPLICATION->IncludeComponent(
            "bitrix:main.include",
            ".default",
            Array(
                "AREA_FILE_SHOW" => "file",
                "AREA_FILE_SUFFIX" => "/include/events.php",
                "COMPONENT_TEMPLATE" => ".default",
                "EDIT_TEMPLATE" => "",
                "PATH" => "/include/events_partnyeram.php"
            )
        );
    }?>
    <div class="sb_action">
        <a href=""><img src="/bitrix/templates/.default/content/11.png" alt=""/></a>
        <h4>Акция</h4>
        <h5><a href="">Мебельная полка всего за 560 Р</a></h5>
        <a href="" class="sb_action_more">Подробнее &rarr;</a>
    </div>
    <div class="sb_reviewed">
        <img src="/bitrix/templates/.default/content/8.png" class="sb_rw_avatar" alt=""/>
        <span class="sb_rw_name">Сергей Антонов</span>
        <span class="sb_rw_job">Руководитель финансового отдела “Банк+”</span>
        <p>“Покупал офисные стулья и столы, остался очень доволен! Низкие цены, быстрая доставка, обслуживание на высоте! Спасибо!”</p>
        <div class="clearboth"></div>
        <div class="sb_rw_arrow"></div>
    </div>
</div>
<div class="clearboth"></div>
</div>
</div>

<div class="ft_footer">
    <div class="ft_container">
        <div class="ft_about">
            <h4><?echo GetMessage("ABOUT_STORE"); ?></h4>
            <?$APPLICATION->IncludeComponent(
                "bitrix:menu",
                "footer_menu",
                Array(
                    "ALLOW_MULTI_SELECT" => "N",
                    "CHILD_MENU_TYPE" => "left",
                    "COMPONENT_TEMPLATE" => "footer_menu",
                    "DELAY" => "N",
                    "MAX_LEVEL" => "1",
                    "MENU_CACHE_GET_VARS" => array(),
                    "MENU_CACHE_TIME" => "3600",
                    "MENU_CACHE_TYPE" => "N",
                    "MENU_CACHE_USE_GROUPS" => "Y",
                    "ROOT_MENU_TYPE" => "bottom",
                    "USE_EXT" => "N"
                )
            );?>
        </div>
        <div class="ft_catalog">
            <h4>Каталог товаров</h4>
            <ul>
                <li><a href="">Кухни</a></li>
                <li><a href="">Кровати и кушетки</a></li>
                <li><a href="">Гарнитуры</a></li>
                <li><a href="">Тумобчки и прихожие</a></li>
                <li><a href="">Спальни и матрасы</a></li>
                <li><a href="">Аксессуары</a></li>
                <li><a href="">Столы и стулья</a></li>
                <li><a href="">Каталоги мебели</a></li>
                <li><a href="">Раскладные диваны</a></li>
                <li><a href="">Кресла</a></li>
            </ul>

        </div>
        <div class="ft_contacts">
            <h4><?echo GetMessage('CONTACT_INFO'); ?></h4>
            <!-- vCard        http://help.yandex.ru/webmaster/hcard.pdf      -->
            <p class="vcard">
						<span class="adr">
							<span class="street-address">ул. Летняя стр.12, офис 512</span>
						</span><?$APPLICATION->IncludeComponent(
                    "bitrix:main.include",
                    ".default",
                    array(
                        "AREA_FILE_SHOW" => "file",
                        "EDIT_TEMPLATE" => "",
                        "PATH" => "/include/phone.php",
                        "COMPONENT_TEMPLATE" => ".default"
                    ),
                    false
                );?>
                <strong>Время работы:</strong> <br/> <span class="workhours">ежедневно с 9-00 до 18-00</span><br/>
            </p>
            <ul class="ft_solcial">
                <li><a href="" class="fb"></a></li>
                <li><a href="" class="tw"></a></li>
                <li><a href="" class="ok"></a></li>
                <li><a href="" class="vk"></a></li>
            </ul>
            <div class="ft_copyright">© 2000 - 2012 "Мебельный магазин" </div>


        </div>

        <div class="clearboth"></div>
    </div>
</div>
</div>
</body>
</html>