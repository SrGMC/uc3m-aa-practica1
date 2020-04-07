#! /bin/bash

# Create output file directory
rm -rf weka_data
mkdir weka_data

# 5 training maps
training=("20Hunt" "newmap" "oneHunt" "custom_pacdot" "mediumClassic")
# 5 testing maps
test=("openHunt" "smallHunt" "trickyClassic" "custom" "classic")

#
# Keyboard
#

# Keyboard: Generate 1.000 training instances
# training_keyboard.arff
control=1
ghosts="RandomGhost"
velocidad=0.6
while [[ $control -ne 0 ]]; do
    for map in ${training[*]}; do
        echo "Generating training data with $map"
        python busters.py -o training_keyboard.arff -l $map -g $ghosts -k 4 -t $velocidad > /dev/null

        if [[ $(wc -l "training_keyboard.arff" | awk '{ print $1 }') -gt 1040 ]]; then
            control=0
            echo "training completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "training_keyboard.arff" "weka_data/training_keyboard.arff"

# Keyboard: Generate 600 testing instances with training maps
# test_samemaps_keyboard.arff
control=1
ghosts="RandomGhost"
while [[ $control -ne 0 ]]; do
    for map in ${training[*]}; do
        echo "Generating training data with $map"
        python busters.py -o test_samemaps_keyboard.arff -l $map -g $ghosts -k 4 -t $velocidad > /dev/null

        if [[ $(wc -l "test_samemaps_keyboard.arff" | awk '{ print $1 }') -gt 640 ]]; then
            control=0
            echo "Test completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "test_samemaps_keyboard.arff" "weka_data/test_samemaps_keyboard.arff"

# Keyboard: Generate 600 testing instances with test maps
# test_othermaps_keyboard.arff
control=1
ghosts="RandomGhost"
while [[ $control -ne 0 ]]; do
    for map in ${test[*]}; do
        echo "Generating training data with $map"
        python busters.py -o test_othermaps_keyboard.arff -l $map -g $ghosts -k 4 -t $velocidad > /dev/null

        if [[ $(wc -l "test_othermaps_keyboard.arff" | awk '{ print $1 }') -gt 640 ]]; then
            control=0
            echo "Test completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "test_othermaps_keyboard.arff" "weka_data/test_othermaps_keyboard.arff"

#
# Automatic
#

# Automatic: Generate 1.000 training instances
# training_tutorial1.arff
control=1
ghosts="RandomGhost"
while [[ $control -ne 0 ]]; do
    for map in ${training[*]}; do
        echo "Generating training data with $map"
        python busters.py -o training_tutorial1.arff -l $map -p BasicAgentAA -g $ghosts -k 4 > /dev/null

        if [[ $(wc -l "training_tutorial1.arff" | awk '{ print $1 }') -gt 1040 ]]; then
            control=0
            echo "training completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "training_tutorial1.arff" "weka_data/training_tutorial1.arff"

# Automatic: Generate 600 testing instances with training maps
# test_samemaps_tutorial1.arff
control=1
ghosts="RandomGhost"
while [[ $control -ne 0 ]]; do
    for map in ${training[*]}; do
        echo "Generating training data with $map"
        python busters.py -o test_samemaps_tutorial1.arff -l $map -p BasicAgentAA -g $ghosts -k 4 -t 0.00001 > /dev/null

        if [[ $(wc -l "test_samemaps_tutorial1.arff" | awk '{ print $1 }') -gt 640 ]]; then
            control=0
            echo "Test completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "test_samemaps_tutorial1.arff" "weka_data/test_samemaps_tutorial1.arff"


# Automatic: Generate 600 testing instances with test maps
# test_othermaps_tutorial1.arff
control=1
ghosts="RandomGhost"
while [[ $control -ne 0 ]]; do
    for map in ${test[*]}; do
        echo "Generating training data with $map"
        python busters.py -o test_othermaps_tutorial1.arff -l $map -p BasicAgentAA -g $ghosts -k 4 -t 0.00001 > /dev/null

        if [[ $(wc -l "test_othermaps_tutorial1.arff" | awk '{ print $1 }') -gt 640 ]]; then
            control=0
            echo "Test completed"
            break
        fi

        if [[ $ghosts == "RandomGhost" ]]; then
            ghosts="StaticGhost"
        else
            ghosts="RandomGhost"
        fi
    done
done
mv "test_othermaps_tutorial1.arff" "weka_data/test_othermaps_tutorial1.arff"
