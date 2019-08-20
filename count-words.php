<?php

// Count words in a HTML file

if (!isset($argv[1])) {
    echo "Provide at least one html file\n";
}

function str_word_count_utf8($str) {
    return count(preg_split('~[^\p{L}\p{N}\']+~u',$str));
}

$count = 0;
$regexCount = 0;
foreach (array_slice($argv, 1) as $file) {
    foreach (glob($file) as $signleFile) {
        $content = strip_tags(file_get_contents($signleFile));
        $count += str_word_count($content);
        $regexCount += str_word_count_utf8($content);
    }
}

echo "Native PHP: ".$count." words\n";
echo "Custom regex: ".$regexCount." words (better for Unicode)";
