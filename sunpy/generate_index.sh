#!/bin/bash
root="./sunpy"
echo "<html>
    <head>
        <title>Sunpy sample data</title>
    </head>
    <body>
        <p> Sunpy versioned sample data, see <a href=https://github.com/sunpy/sample-data/tree/master/sunpy/>GitHub</a> for sources.
        <h2> File Listing</h2>

        "
echo "<ul>"
for file in "$root"/*/*; do
  parentpath="${file#*/}"
  parent="${parentpath%/*}"
  filename="${file##*/}"
  if [[ -z $oldparent ]]; then
    echo "  <li> $parent </li>" && oldparent="$parent"
    echo "  <ul>"
  elif [[ $oldparent != $parent ]]; then
    echo "  </ul>"
    echo "  <li> $parent </li>" && oldparent="$parent"
    echo "  <ul>"
  fi
  echo "    <li><a href=\"$parentpath\">$filename</a></li>"
done
echo "  </ul>"
echo "</ul>"
echo "</body>"
echo "</html>"
