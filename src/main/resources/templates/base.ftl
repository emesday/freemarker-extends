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