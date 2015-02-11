if [ -z "$1" ]
  then
    echo "No argument supplied"
    lambda_ratio=1
else
    lambda_ratio=$1
fi

if [ -z "$2" ]
  then
    echo "No argument supplied"
    ytop_ratio=1
else
    ytop_ratio=$2
fi

if [ -z "$3" ]
  then
    echo "No argument supplied"
    c2_ratio=1
else
    c2_ratio=$3
fi

#dir=/lustre/cmswork/tosi/ana/hh2bbbb/non-resonant/event_generation/lhe/
dir=/lustre/cmswork/tosi/ana/hh2bbbb/non-resonant/event_generation/lhe/SCENARIO2/

#for lambda_ratio in 1 2 10 15 20 m1 m2 m10 m15 m20
#do
#    for ytop_ratio in 05 075 1 125 16 23
#    do
#	tmp=${dir}L${lambda_ratio}y${ytop_ratio}.lhe
#	if [ -e $tmp ]
#	then
#	    echo "doing ${tmp}"
#	    grep "25    1    1    2    0" ${tmp} | gawk '{pdgID=$1; px=$7; py=$8; pz=$9; print px "\t" py "\t" pz}' > ascii_L${lambda_ratio}y${ytop_ratio}.txt
#	fi
#    done
#done

tmp=${dir}L${lambda_ratio}y${ytop_ratio}c${c2_ratio}.lhe
echo "doing ${tmp}"
if [ -e $tmp ]
then
    echo "doing ${tmp}"
    grep "25    2    1    2    0" ${tmp} | gawk '{pdgID=$1; px=$7; py=$8; pz=$9; print px "\t" py "\t" pz}' > ascii_L${lambda_ratio}y${ytop_ratio}c${c2_ratio}.txt
fi

for lambda_ratio in 1 2 10 15 20 m1 m2 m10 m15 m20
do
    for ytop_ratio in 05 055 075 1 125 16 23
    do
	for c2_ratio in 2
	do
	    tmp=${dir}L${lambda_ratio}y${ytop_ratio}_${c2}.lhe
#	for file in  0-1k 1-2k 2-3k 3-4k 4-5k 5-6k 6-7k 7-8k 8-9k 9-10k
#	do
#	    tmp=${dir}L${lambda_ratio}y${ytop_ratio}_${file}.lhe
	    if [ -e $tmp ]
	    then
		echo "doing ${tmp}"
		grep "25    1    1    2    0" ${tmp} | gawk '{pdgID=$1; px=$7; py=$8; pz=$9; print px "\t" py "\t" pz}' > ascii_L${lambda_ratio}y${ytop_ratio}_${file}.txt
	    fi
	done
    done
done
