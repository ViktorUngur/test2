if test $# -lt 3
then
    echo "Usage $0 file dir n1 n2 n3 ..."
fi

numeFisier=$1
numeDirector=$2
countGreaterThanTen=0
suma=0

shift 2

for argument in "$@"
do
    if test "$argument" -gt 10
    then
	countGreaterThanTen=`expr $countGreaterThanTen + 1`
	suma=`expr $suma + $argument`
    else
	suma=`expr $suma + $argument`
    fi
done

echo $countGreaterThanTen
echo $suma
echo $suma | wc -L

echo $numeFisier

if test -f $numeFisier
then
    echo $countGreaterThanTen > $numeFisier
    echo $suma >> $numeFisier
fi

for element in $(ls $numeDirector)
do
    
    extension=$(echo "$element" | cut -f 2 -d '.')
    if test "$extension" = "txt"
    then
	cat "$numeDirector/$element"
    fi
    
done

   

