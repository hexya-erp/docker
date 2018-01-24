#!/bin/sh

echo ""
echo "1 - Generating Hexya..."
hexya generate 2>/dev/null

echo ""
echo "2 - Compiling Hexya..."
cd $GOPATH/src/github.com/hexya-erp/hexya && go install ./...

echo ""
echo "3 - Updating db..."
hexya updatedb

echo ""
echo "4 - Starting server..."
hexya server