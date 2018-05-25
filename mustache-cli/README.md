Still writing static HTML? where are you from, 2009(interestingly, that's when mustache was introduced)?

Just kidding.

If you don't know what Mustache is, read about it : [https://mustache.github.io/mustache.5.html](https://mustache.github.io/mustache.5.html "Um, Mustache Manual?").

If you still don't know what it is after reading the manual, Mustache is kinda like a preprocessor for HTML.

If all you need are static HTML pages for a project(no server-side languages; you know, the fun-stuff..), yet there are so many of them and they are identical, prepare to be mind blown.

Hey, this is as much as exhausting for you me to write as it is for you to read. So, jumping to quick setup:

**Step 1 :** Install Mustache CLI. 

I have used Node method(the easiest, isn't it?) from [https://www.npmjs.com/package/mustache](https://www.npmjs.com/package/mustache, 'Another title')

In cmd, run the following command :
```
npm install -g mustache
```

**Step 2 :** Setup files

*data.json >*
```json
{
	"sitename":"Awesome Website",
	"description":"Description for your website",
	"year":"2018",
	"primarycolor":"#F89"
}
```
*index.mustache >*
```html
<html>
<head>
<title>
  {{sitename}} <!-- stuff within double braces will be filled by mustache from data.json -->
</title>
<body>
  Welcome to {{sitename}}
</body>
</html>
```

**Step 3 :** Run the command (make sure your are in the same directory as the files or give the full path for files)
```
mustache data.json index.mustache output\index.html
```

**Step 4 :** And voila, index.html(in output directory):
```html
<html>
<head>
<title>
  Awesome Website <!-- stuff within double braces will be filled by mustache from data.json -->
</title>
<body>
  Welcome to Awesome Website
</body>
</html>
```

NOT IMPRESSED? that's not all. Let's take a look at a few more things.

### Partials
Partials are different files you can merge to compile awesome new files.

Like when you have header and footer for all static pages. You can include them in files like this :
```
{{> header}}
```
which will include header.mustache file.

You need provide `-p` option with the filename to render it using command line. Example :
```
mustache data.json index.mustache -p header.mustache -p footer.mustache output\index.html
```

### Other awesome stuff you can do with Mustache
**Insert text if value is not false** 
```
{{#variableName}}
Text to be shown or {{variableName}}
{{/variableName}}
```
if variableName:false , the text will not be rendered, if it contains any other value, text will be shown

**Repeatedly insert values**
*JSON*
```json
{
  "menu":[
    {"name":"Home", "link":"index.html"},
    {"name":"About us", "link":"about.html"},
    {"name":"Contact us", "link":"contact.html"}
  ]
}
```
*MUSTACHE*
```html
<header>
  <ul>
    {{#menu}}
    <li> <a href="{{link}}">{{name}}</a> </li>
    {{/menu}}
  </ul>
<header>
```
*OUTPUT*
```html
<header>
  <ul>
    <li> <a href="index.html">Home</a> </li>
    <li> <a href="about.html">About us</a> </li>
    <li> <a href="contact.html">Contact us</a> </li>
  </ul>
<header>
```
This project includes some workarounds to use different(multiple) data files for different templates.
Have a look at the .bat file. 
