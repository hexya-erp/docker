#!/bin/sh
cd /hexya-demo

echo ""
echo "1 - Generating Hexya..."
hexya generate .

echo ""
echo "2 - Updating db..."
hexya updatedb

echo ""
echo "3 - Starting server..."
hexya server