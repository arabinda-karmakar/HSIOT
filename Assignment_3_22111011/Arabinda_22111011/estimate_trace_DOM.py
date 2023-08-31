# -*- coding: utf-8 -*-
"""
Created on Thu Feb 21 13:47:48 2019

@author: Prof.D Mukhopadhyay
"""

import csv
import numpy as np
import matplotlib.pyplot as plt
#import aes



wstart = 2
wstop = 13
#wlen = wstop-wstart

wlen=11 

#aesmod = aes.AES(aes.mky)


InvSbox = (
    0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
    0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
    0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
    0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
    0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
    0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
    0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
    0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
    0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
    0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
    0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
    0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
    0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
    0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
    0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D,
)

j=1
while (j>=0): #While loop runs two times in order to get 4th and 5th byte.
    myfile = r"/Users/vamshikiranmorlawar/Desktop/CS666A/CS666/Assignment_3_22111066/DOM/HW_power_trace_4.csv"
    
    sarr_a = np.array([0] * wlen)
    sarr_b = np.array([0] * wlen)

    ntraces_a = 0
    ntraces_b = 0

    dom_arr = np.zeros((256,wlen),dtype='float')


    ###############################################################################
    number_of_traces = 10000 ### this you can vary upto 8940
    for kb in range(256):      
            print ("Processing: "+ hex(kb))
            dofmean=np.zeros(wlen,dtype='float')
            with open(myfile) as csv_file:
                i=0
                csv_reader = csv.reader(csv_file, delimiter=',')
                for row in csv_reader:
                    ct = int(row[1],10)
                    #print hex(ct)
                    shift_regain_left = (8*j)-40               
                    # As when we left shift 120, we get 0th byte. 
                    #So, to get 5th and 4th byte respectively we shift 40 and 32 less to left.
                    ct_temp = (ct >> (120+shift_regain_left))
                    ct_temp &= 0b11111111
                    #print hex(ct_temp)
                    state_9th=InvSbox[ct_temp^kb]
                    binexp = '{0:08b}'.format(state_9th)
                
                    if(binexp[0] == '1'):
                        sarr_a = np.add(sarr_a,np.array(row[wstart:wstop]).astype(np.float))
                        #print sarr_a
                        ntraces_a = ntraces_a + 1
                    if(binexp[0] == '0'): 
                        sarr_b = np.add(sarr_b,np.array(row[wstart:wstop]).astype(np.float))
                        #print sarr_b
                        ntraces_b = ntraces_b + 1
                    i=i+1
                    if i==number_of_traces: break
                    
            marr_a = sarr_a/float(ntraces_a)
            marr_b = sarr_b/float(ntraces_b)

            dofmean = np.subtract(marr_a,marr_b)
            dofmean = np.abs(dofmean)
            
            dom_arr[kb] = dofmean
            print (max(dofmean))
            ntraces_a=0
            ntraces_b=0
            sarr_a = np.array([0]*wlen)
            sarr_b = np.array([0]*wlen)
            del dofmean

    ###############################################################################

    fig, ax1 = plt.subplots()
    maxval=0
    for i in range(256):
        row = dom_arr[i]
        tp = range(len(row))
        if(maxval<max(row)):
            maxval=max(row)
            correct_key=i
            correct_row=row
            
    print (5-j,"'th","correct_key_byte="+str(correct_key))
    j = j - 1


    for i in range(256):
        row=dom_arr[i]
        tp=range(len(row))
        if (i==correct_key):
            plt.plot(range(len(correct_row)),correct_row , 'r', linewidth=0.2,label='Correct Key Byte')
        else:
            plt.plot(tp, row, 'k', linewidth=0.2)
            


    #tp = range(len(dofmean_correct))
    #plt.plot(tp, dofmean_correct, 'r', linewidth=0.2,label='Correct Key Byte')
    ax1.legend()
    plt.locator_params(axis='y', nbins=5)
    plt.title('Difference of Mean Plot')
    plt.xlabel('Sample Points')
    plt.ylabel('Difference of Mean')
    plt.savefig("DOM_AllKeyByte.png",dpi=1200,bbox_inches='tight')
    plt.show()
    ###############################################################################