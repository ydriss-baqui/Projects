#!/bin/bash
declare -a Mescsv=("bosses.csv" "classes.csv" "enemies.csv" "players.csv" "races.csv" "spells.csv" "traps.csv")
Exit=0
MyRand=0
MyPlayer=""
MyMob=""
MyRate=""
MyBoss=""
HpMaxE=0
HpMaxP=0
HpAP=0
HpAE=0
BdmgE=0
BdmgP=0
Stage=1

declare -a MesBoss
declare -a MesMobs
declare -a PlayerStats
declare -a MobStats
declare -a BossStats
Rand (){
    MyRand=$(( $RANDOM % 100 ))
} 
SelectPlayer(){
    Rand
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyRand" -lt 50 ] && [ "$rarity" == "1" ] ;then
	    MyPlayer="Link"
	elif [ "$MyRand" -gt '49' ] && [ "$MyRand" -lt '80' ] && [ "$rarity" == "2" ] ;then
	    MyPlayer="Young Link"
	elif [ "$MyRand" -gt '79' ] && [ "$MyRand" -lt '95' ] && [ "$rarity" == "3" ] ;then
            MyPlayer="Sheik"
	elif [ "$MyRand" -gt '94'  ] && [ "$MyRand" -lt '100' ] && [ "$rarity" == "4" ] ;then
	    MyPlayer="Impa"
	elif [ "$MyRand" == '100' ] ;then
	    MyPlayer="Hylia"
	fi
    done < "${Mescsv[3]}"
}
SelectMob(){
    local Rand
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyRand" -lt 50 ] && [ "$rarity" == "1" ] ;then
	    MesMobs+=("$name")
	elif [ "$MyRand" -gt '49' ] && [ "$MyRand" -lt '80' ] && [ "$rarity" == "2" ] ;then
            MesMobs+=("$name")
	elif [ "$MyRand" -gt '79' ] && [ "$MyRand" -lt '95' ] && [ "$rarity" == "3" ] ;then
	    MesMobs+=("$name")
	elif [ "$MyRand" -gt '94'  ] && [ "$MyRand" -lt '100' ] && [ "$rarity" == "4" ] ;then
	    MesMobs+=("$name")
	elif [ "$MyRand" == '100' ] ;then
	    MesMobs+=("$name")
	fi
    done < "${Mescsv[2]}"
    len=${#MesMobs[@]}
    if [ "$len" == '1' ] ;then
	MyMob=${MesMobs[0]}
    elif [ "$len" == '2' ] ;then
	local Rand
	if [ "$MyRand" -lt '50' ] ;then
	    MyMob=${MesMobs[0]}
	elif [ "$MyRand" -ge '50' ] ;then
	    MyMob=${MesMobs[1]}
	fi
    elif [ "$len" == '3' ] ;then
	local rand
	if [ "$MyRand" -lt '33' ] ;then
	    MyMob=${MesMobs[0]}
	elif [ "$MyRand" -ge '33' ] && [ "$MyRand" -lt '66' ] ;then
	     MyMob=${MesMobs[1]}
	elif [ "$MyRand" -ge '66' ] ;then
	    MyMob=${MesMobs[2]}
	fi
    elif [ "$len" == '4' ] ;then
	 local rand
	 if [ "$MyRand" -lt '25' ] ;then
	     MyMob=${MesMobs[0]}
	 elif [ "$MyRand" -ge '25' ] && [ "$MyRand" -lt '50' ] ;then
	     MyMob=${MesMobs[1]}
	 elif [ "$MyRand" -ge '50' ] && [ "$MyRand" -lt '75' ] ;then
	     MyMob=${MesMobs[2]}
	 elif [ "$MyRand" -ge '75' ] ;then
	     MyMob=${MesMobs[3]}
	 fi
     fi
}
SelectBoss (){
    local Rand
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyRand" -lt 50 ] && [ "$rarity" == "1" ] ;then
	    MesBoss+=("$name")
	elif [ "$MyRand" -gt '49' ] && [ "$MyRand" -lt '80' ] && [ "$rarity" == "2" ] ;then
            MesBoss+=("$name")
	elif [ "$MyRand" -gt '79' ] && [ "$MyRand" -lt '95' ] && [ "$rarity" == "3" ] ;then
	    MesBoss+=("$name")
	elif [ "$MyRand" -gt '94'  ] && [ "$MyRand" -lt '100' ] && [ "$rarity" == "4" ] ;then
	    MesBoss+=("$name")
	elif [ "$MyRand" == '100' ] ;then
	    MesBoss+=("$name")
	fi
    done < "${Mescsv[0]}"
    len=${#MesBoss[@]}
    if [ "$len" == '1' ] ;then
	MyBoss=${MesBoss[0]}
    elif [ "$len" == '2' ] ;then
	local Rand
	if [ "$MyRand" -lt '50' ] ;then
	    MyBoss=${MesBoss[0]}
	elif [ "$MyRand" -ge '50' ] ;then
	    MyBoss=${MesBoss[1]}
	fi
    elif [ "$len" == '3' ] ;then
	local rand
	if [ "$MyRand" -lt '33' ] ;then
	    MyBoss=${MesBoss[0]}
	elif [ "$MyRand" -ge '33' ] && [ "$MyRand" -lt '66' ] ;then
	    MyBoss=${MesBoss[1]}
	elif [ "$MyRand" -ge '66' ] ;then
	    MyBoss=${MesBoss[2]}
	fi
    elif [ "$len" == '4' ] ;then
	 local rand
	 if [ "$MyRand" -lt '25' ] ;then
	     MyBoss=${MesBoss[0]}
	 elif [ "$MyRand" -ge '25' ] && [ "$MyRand" -lt '50' ] ;then
	     MyBoss=${MesBoss[1]}
	 elif [ "$MyRand" -ge '50' ] && [ "$MyRand" -lt '75' ] ;then
	     MyBoss=${MesBoss[2]}
	 elif [ "$MyRand" -ge '75' ] ;then
	     MyBoss=${MesBoss[3]}
	 fi
     fi
}
PStats () {
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyPlayer" == "$name" ] ;then
	    PlayerStats+={"$id $name $hp $mp $str $int $def $res $spd $luck $race $rarity"}
	    HpMaxP=$hp
	    BdmgP=$str

	fi
	
    done < "${Mescsv[3]}"
}

MStats () {
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyMob" == "$name" ] ;then
	    MobStats+={"$id $name $hp $mp $str $int $def $res $spd $luck $race $rarity"}
	    HpMaxE=$hp
	    BdmgE=$str
   

	
	fi
    done < "${Mescsv[2]}"
}
BStats (){
    while IFS=',' read id name hp mp str int def res spd luck race class rarity ;do
	if [ "$MyBoss" == "$name" ] ;then
	    BossStats+={"$id $name $hp $mp $str $int $def $res $spd $luck $race $rarity"}
            HpMaxE=$hp
	    BdmgE=$str
	fi
    done < "${Mescsv[0]}"
}
AttackP(){
    HpAE=$(($HpAE-$BdmgP))
}
AttackE(){
    HpAP=$(($HpAP-$BdmgE))
}
Heal(){
    Heal=$(($HpMaxP/2))    
    HpAP=$(($HpAP+$Heal))
    if [ $HpAP -ge $HpMaxP ] ;then
	HpAP=$HpMAxP
    fi
}
OptionC() {
    read input
	if [ $input -eq '1' ] ;then
	   AttackP
	elif [ $input -eq '2' ] ;then
	   Heal
	else
	   exit
	
        fi
}
SetUpHp(){
    HpAP=$HpMaxP
    HpAE=$HpMaxE
}
AffichageSMob(){
    echo ======= STAGE $Stage =====
    echo $MyMob
    echo "HP : $HpAE/$HpMaxE"
    echo $MyPlayer
    echo "HP : $HpAP/$HpMaxP"
    echo "---Vos Options---"
    echo "1.Attack 2.Heal (Any number for exit)"
}
AffichageSBoss(){
    echo ======= STAGE $Stage =====
    echo $MyBoss
    echo "HP : $HpAE/$HpMaxE"
    echo ""
    echo $MyPlayer
    echo "HP : $HpAP/$HpMaxP"
    echo ""
    echo "---Vos Options---"
    echo "1.Attack 2.Heal (3.Exit)"
}

SelectPlayer
PStats
HpAP=$HpMaxP

while [ $Exit -eq '0' ] ;do
    if [ $Stage -lt '10' ] ;then
	if [ $HpAE -eq '0' ] ;then
             SelectMob
	     MStats
	     HpAE=$HpMaxE
	fi     
	AttackE
	AffichageSMob
	OptionC
	if [ $HpAP -le '0' ] ;then
	    Exit=1
	elif [ $HpAP -le '0' ]   ;then
	    echo "Vous passez au next stage"
	    Stage=$(($Stage+1))
	fi
    elif [ $Stage -eq '10' ] ;then
	if [ $HpAE -eq '0' ] ;then
             SelectMob
	     MStats
	     HpAE=$HpMaxE
	fi     
	AttackE
	AffichageSBoss
	OptionC
       
	if [ $HpAP -le '0' ]  ;then
	    Exit=1
	elif [ $HpAP -le '0' ]  ;then
	    Exit=2
	fi
    fi
done
if [ $Exit -eq '1' ] ;then
    echo "Vous etes mort"
    echo "1.New Game 2.Exit"
    read Game
    if [ $Game == '1' ] ;then
	Stage=1
	Exit=0
    else
	    exit
    fi
elif [ $Exit -eq '2' ] ;then
    echo "Vous avez Gagnez !"
      echo "1.New Game 2.Exit"
    read Game
    if [ $Game == '1' ] ;then
	Stage=1
	Exit=0
    else
	 exit

    fi
fi
    
