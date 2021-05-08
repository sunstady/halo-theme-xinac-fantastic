<!DOCTYPE html>
<#macro layout title,canonical>
<#include "common/head.ftl">
<#include "common/navbar.ftl">
<#include "common/widget.ftl">
<#include "common/module.ftl">

<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>${title!}</title>
    <meta name="keywords" content="${meta_keywords!}" />
    <meta name="description" content="${meta_description!}" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="${title!}" />
    <meta property="og:url" content="${canonical}" />
    <meta property="og:site_name" content="${title!}" />
    <meta property="og:description" content="${meta_description!}" />
    <meta property="og:locale" content="zh-CN" />
    <meta property="og:image" content="${user.avatar!}" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="${title!}" />
    <meta name="twitter:description" content="${meta_description!}" />
    <meta name="twitter:image" content="${user.avatar!}" />
    <link rel="canonical" href="${canonical!}" />
    <link rel="alternative" href="${atom_url!}" title="${blog_title!}" type="application/atom+xml" />

<@global.head />

    <link rel="stylesheet" href="${settings.cdn_bulma_css!}" />
    <link rel="stylesheet" href="${settings.cdn_fontawesome_css!}" />
    <link rel="stylesheet" href="${settings.cdn_google_fonts!}/css?family=Fira+Sans&display=swap" />
<#if is_post?? || is_sheet?? || is_journal??>
    <link rel="stylesheet" href="${settings.cdn_lightgallery_css!}" />
    <link rel="stylesheet" href="${settings.cdn_justifiedGallery_css!}" />
</#if>
    <link rel="stylesheet" href="${theme_base!}/source/css/bundle.css" />
    <link rel="stylesheet" href="${theme_base!}/source/css/back-to-top.css" />
<#if is_index??>
    <link rel="stylesheet" href="${theme_base!}/source/css/widget_pin.css" />
    <link rel="stylesheet" href="${settings.cdn_swiper_css!}" />
</#if>
<#if settings.kanbanniang!true>
    <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
</#if>
    <script type="text/javascript" src="${settings.cdn_pace_js!}"></script>
    <#include "./plugin/style.theme.ftl">
    <link rel="stylesheet" href="${theme_base!}/source/lib/outdatedbrowser/outdatedbrowser.min.css" />
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css" />
    <style>
        /*body > .footer,*/
        body > .navbar,
        body > .section {
            opacity: 0;
        }
    <#if is_post?? || is_sheet?? || is_journal??>
        .content code .number {
            background-color: transparent;
            border-radius: 0;
            display: unset;
            font-size: 1em;
            margin-right: 0;
            padding: 0;
            vertical-align: unset;
        }
        .tag {
            font-size: 1em !important;
            padding-right: 0 !important;
            padding-left: 0 !important;
        }
        .attr-name {
            padding-left: 0.75em !important;
        }
        .footer {
            padding: 0.5rem 2rem 2rem !important;
        }
    </#if>
    </style>
<#if is_post?? || is_sheet?? || is_journal??>
    <link rel="stylesheet" href="${theme_base!}/source/lib/prism/css/prism-${settings.code_pretty!'Default'}.css" />
</#if>
</head>

<body class="is-3-column">
    <@navbar 'page' />
    <div class="card-normal">
        <section class="section">
            <div class="container">
                <div class="columns"><#--<#if is_sheet??>is-centered</#if>-->
                    <#if post?? >
                        <#if is_post??>
                            <#if settings.share_type !=''>
                                <@module 'share' />
                            </#if>
                            <div class="column is-12-tablet is-8-desktop is-8-widescreen is-8-fullhd has-order-2 column-main">
                                <#nested />
                            </div>
                            <@widget 'right' />
                        <#elseif is_sheet??>
                            <div class="column is-12-tablet is-9-desktop is-9-widescreen is-9-fullhd has-order-3 column-main">
                                <#nested />
                            </div>
                            <@widget 'right' />
                        </#if>
                    <#else >
                        <#if is_index??>
                            <div class="column is-8-tablet is-8-desktop is-9-widescreen is-9-fullhd has-order-2 column-main"
                                 style="margin-left: 10px">
                                <div class="columns">
                                    <div class="column is-12-tablet is-12-desktop is-12-widescreen has-order-2 column-main">
                                        <#--判断是否已经有置顶文章-->
                                        <#list posts.content as post>
                                            <#if post.topPriority == 1>
                                                <#assign isTop = 'yes'>
                                                <#break>
                                            </#if>
                                        </#list>
                                        <#if isTop??>
                                            <div class="level">
                                                <#--<#include "./common/widget_pin.ftl">-->
                                                <@module 'slider' />
                                            </div>
                                        </#if>
                                        <div class="level is-medium">
                                            <div class="ceta">
                                                <div class="tabs" style="overflow: hidden;">
                                                    <ul style="overflow: hidden;border-bottom-style: none">
                                                        <li class="is-active"><a>全部</a></li>
                                                        <@categoryTag method="list">
                                                            <#list categories?sort_by("postCount")?reverse as category>
                                                                <#if category_index < 7>
                                                                    <li>
                                                                        <a href="${category.fullPath!}"
                                                                           style="text-transform: capitalize;">${category.name!}</a>
                                                                    </li>
                                                                </#if>
                                                            </#list>
                                                        </@categoryTag>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="level">
                                            <div class="columns" style="width: 105%;">
                                                <div class="column is-12-tablet is-12-desktop is-8-widescreen is-8-fullhd has-order-2 column-main">
                                                    <#nested />
                                                </div>
                                                <@widget 'right' />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <@widget 'left' />
                        <#else>
                            <div class="column is-12-tablet is-8-desktop is-6-widescreen is-6-fullhd has-order-2  column-main">
                                <#nested />
                            </div>
                            <@widget 'left' />
                            <@widget 'right' />
                        </#if>
                    </#if>
                </div>
            </div>
        </section>
    </div>
    <#include "common/scripts.ftl">
    <#include "common/footer.ftl">
    <#include "search/local.ftl">
</body>
</html>
</#macro>
