#! /bin/bash

# Run this script in mind-documentation folder to generate api reference part from latest released mind framework.
# To use this script, you need to install [godocdown](https://github.com/robertkrimen/godocdown) first.

DIRS=("mind/core/framework") # code need to generate
PREFIX='APIReference'

TEMP_DIR="tmp"
TEMP_PATH="tmp/tmp"
TEMP_FILE="tmp.go"

echo_summary() {
    dir=$PREFIX/`echo $1 | sed 's/mind\/core\///' | sed 's/framework\///'`
    n=`echo $dir | tr "/" " " | wc -w`
    n=`expr $n "*" 2 - 2`
    printf %${n}s >> SUMMARY.md
    echo "* [${dir/*\//}](${dir}.md)" >> SUMMARY.md
}

gen_doc() {
    dir=$1
    if [[ -z $2 ]]; then
        doc_name=${dir/mind\/core\/framework\//}
    else
        doc_name=$2
    fi

    mkdir -p $PREFIX/$doc_name
    GOPATH=$TEMP_PATH godocdown $dir | sed " s/^--$/----/g" > $PREFIX/${doc_name}.md
    #GOPATH=$TEMP_PATH godocdown -plain $dir | sed " s/^--$/----/g" > $PREFIX/${doc_name}.md
    if [[ -e $PREFIX/${doc_name}.md && \
        `cat $PREFIX/${doc_name}.md | head -n 5 | grep "//[ ]*INTERNAL"` == "" && \
        -s $PREFIX/${doc_name}.md
            ]]; then
        echo "Generate $dir"
        echo_summary $dir
    else
        echo "Skip $dir"
        rm $PREFIX/${doc_name}.md
    fi
}


# Generate document
gen_all() {
    for DIR in $DIRS; do
        # Remove INTERNAL code
        rm -rf $TEMP_PATH/src/$DIR
        mkdir -p $TEMP_PATH/src/$DIR
        cp -r ${TEMP_DIR}/src/$DIR/* $TEMP_PATH/src/$DIR
        src_files=`find ${TEMP_PATH}/src/$DIR -type f`
        for src_file in $src_files; do
            if [[ ! -e $src_file ]]; then
                echo "File gone: $src_file"
                continue
            fi
            if [[ `cat $src_file | grep package -n1 | grep '//[ ]*INTERNAL' | wc -l | tr -d ' '` == "1" ]]; then
                echo "Delete package: `dirname $src_file`"
                rm -rf `dirname $src_file`
            else
                rm -f $TEMP_FILE
                touch $TEMP_FILE
                copy_flag=0
                while IFS='' read -r line || [[ -n "$line" ]]; do
                    if [[ $line == "//INTERNAL" || $line == "// INTERNAL" ]]; then
                        copy_flag=1
                    fi
                    if [[ $copy_flag == 0 ]]; then
                        # echo "Write line: $line"
                        echo "$line" >> $TEMP_FILE
                    else
                        echo "" >> $TEMP_FILE
                        echo "Skip line: $line" >> skip.log
                    fi
                    if [[ $line == "}" || $line == "" ]]; then
                        copy_flag=0
                    fi
                done < $src_file
                cp $TEMP_FILE $src_file
            fi
        done

        dirs=`find ${TEMP_PATH}/src/$DIR -type d`
        for dir in $dirs; do
            dir=${dir/${TEMP_PATH}\/src\//}
            gen_doc $dir
        done
    done
}

# Download latest mind framework
mkdir -p $TEMP_DIR
curl -o $TEMP_DIR/mind.tar.gz https://cdn-static.vincross.com/downloads/mind/latest/mind.tar.gz
tar -C $TEMP_DIR -zxf $TEMP_DIR/mind.tar.gz

# Remove old API Reference part
sed -n '/## API Reference/q;p' SUMMARY.md > SUMMARY.md.tmp
mv SUMMARY.md.tmp SUMMARY.md

# Generate new API Reference part
echo "## API Reference" >> SUMMARY.md
echo "" >> SUMMARY.md
echo "* [Robot Part]($PREFIX/robotpart.md)" >> SUMMARY.md
gen_all
echo "* [Remote Part]($PREFIX/remotepart.md)" >> SUMMARY.md

# Remove temp files
mv $PREFIX/mind/core/framework.md $PREFIX
rm -r $PREFIX/mind
rm $TEMP_FILE
rm -rf $TEMP_PATH/src
rm -rf $TEMP_DIR
