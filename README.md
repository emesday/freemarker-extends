# (Apache FreeMarker)[https://github.com/apache/freemarker] `extends` directive

This repository provides the simple solution.

# Quick start 

1. copy the following code to `extends.ftl`

```injectedfreemarker
<#if !blocks??>
    <#assign blocks = {} />
</#if>

<#macro extends ftl>
    <#nested />
    <#include ftl />
</#macro>

<#macro replace name>
    <#local value>
        <#nested />
    </#local>
    <#assign blocks += {name: value} />
</#macro>

<#macro block name>
    <#if blocks[name]??>
        <!-- replaced ${name} -->
        ${blocks[name]}
    <#else>
        <!-- default ${name} -->
        <#nested />
    </#if>
</#macro>
```

2. define your layout as `base.ftl` 

```injectedfreemarker
<#import "extends.ftl" as layout />

<!DOCTYPE html>
<html>
<head>
    <title>A demo of FreeMarker extends directive</title>
</head>
<body>
<@layout.block "message">
    This is default message in base.ftl
</@layout.block>
</body>
</html>
```

3. extends the layout as `index.ftl`

```injectedfreemarker
<#import "extends.ftl" as layout />

<@layout.extends "base.ftl">
    <@layout.replace "message">
        This is the message from index.ftl
    </@layout.replace>
</@layout.extends>
```

That's it.

# Macros

- extends: extends like Jinja2
- block: block like Jinja2
- replace: replace the block. In Jinja2, `block` does this. I tried but it was complicated.

# Run

```shell
$ ./gradlew run
# run the follow in different shell
$ curl http://localhost:8080/html-freemarker


<!DOCTYPE html>
<html>
<head>
    <title>A demo of FreeMarker extends directive</title>
</head>
<body>
        <!-- replaced message -->
                This is the message from index.ftl

</body>
</html>
```
