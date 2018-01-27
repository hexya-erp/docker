#!/bin/sh

echo ""
echo "1 - Generating Hexya..."
hexya generate 2>/dev/null

echo ""
echo "2 - Updating db..."
hexya updatedb

echo ""
echo "3 - Starting server..."
hexya server