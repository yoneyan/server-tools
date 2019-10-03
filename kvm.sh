#!/bin/bash

#HDD Path
HDD=/kvm/image
#SSD Path
SSD=/mnt/bootdata/kvm/image/
#ISO Path
ISO=/kvm/iso



echo 'This script is KVM operation assistance.'
echo '1: create   2: delete'
read choose
echo 'selected ' $choose
# VM Name
echo 'vm name?'
read name



if [ $choose -eq 1 ]; then
    # Memory
    echo 'Memory?'
    read memory
    # core
    echo 'core?'
    read core
    # os-type
    echo 'os-type?'
    echo 'example linux'
    read os_type
    # os-variant
    echo 'os-variant?'
    read os_variant
    # network
    echo 'network?'
    read network
    # location
    echo 'location?'
    read location
    # vnc
    echo 'vnc setting'
    echo 'port?'
    read vnc_port
    echo 'create disk image?'
    echo '1: Yes   2: No'
    read answer
    echo '1: HDD   2: SSD'
    read spec
    if [ $answer == 1 -o $spec == 1 ]; then
        echo sh $CMD $HDD/$name
    elif [ $answer == 1 -o $spec == 2 ]; then
        echo sh qemu-img create -f qcow2 $PATH.qcow2 $size $SSD/$name
    elif [ $answer == 2 -o $spec == 1 ]; then
        STORAGE=$HDD/name
    elif [ $answer == 2 -o $spec == 1 ]; then
        STORAGE=$SSD/name
    fi
    
    sudo virt-install --name $name --ram $memory --vcpus $vcpus --os-type $os_type --os-variant $os_variant --network=bridge:$network --location $location --graphics vnc,port=$vnc_port,listen=0.0.0.0 --disk $STORAGE --console pty,target_type=serial --extra-args 'console=ttyS0,115200n8 serial'

elif [ $choose == 2 ]; then
    virsh destroy $name
    echo 'Can I delete storage?'
    echo '1: Yes    2: No'
    read answer
    if [ $answer == 1 ]; then
        virsh undefine $name --remove-all-storage
    else
        virsh undefine $name
    fi
fi
