<div class="hd_header">
    <table>
        <tr>
            <td rowspan="2" class="hd_companyname">
                <h1><?$APPLICATION->IncludeComponent(
                        "bitrix:main.include",
                        ".default",
                        Array(
                            "AREA_FILE_SHOW" => "file",
                            "COMPONENT_TEMPLATE" => ".default",
                            "EDIT_TEMPLATE" => "",
                            "PATH" => "/include/logo.php"
                        )
                    );?></h1>
            </td>
            <td rowspan="2" class="hd_txarea">
                <?$APPLICATION->IncludeComponent(
                    "bitrix:main.include",
                    ".default",
                    array(
                        "AREA_FILE_SHOW" => "file",
                        "EDIT_TEMPLATE" => "",
                        "PATH" => "/include/phone.php",
                        "COMPONENT_TEMPLATE" => ".default"
                    ),
                    false
                );?><br/>
                время работы <span class="workhours">ежедневно с 9-00 до 18-00</span>
            </td>
            <td style="width:232px">
                <form action="">
                    <div class="hd_search_form" style="float:right;">
                        <input placeholder="Поиск" type="text"/>
                        <input type="submit" value=""/>
                    </div>
                </form>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 11px;">
                <?$APPLICATION->IncludeComponent("bitrix:system.auth.form",
                    "auth",
                    Array(
                    "COMPONENT_TEMPLATE" => ".default",
                    "FORGOT_PASSWORD_URL" => "/user/change_password.php",
                    "PROFILE_URL" => "/user/profile.php",
                    "REGISTER_URL" => "/user/registration.php",
                    "SHOW_ERRORS" => "Y",
                ),
                );?>
            </td>
        </tr>
    </table>
    <?$APPLICATION->IncludeComponent(
        "bitrix:menu",
        "top_multi",
        Array(
            "ALLOW_MULTI_SELECT" => "N",
            "CHILD_MENU_TYPE" => "left",
            "DELAY" => "N",
            "MAX_LEVEL" => "2",
            "MENU_CACHE_GET_VARS" => array(0=>"",),
            "MENU_CACHE_TIME" => "3600",
            "MENU_CACHE_TYPE" => "N",
            "MENU_CACHE_USE_GROUPS" => "Y",
            "ROOT_MENU_TYPE" => "top",
            "USE_EXT" => "N"
        )
    );?><br>
</div>