import os
import xlsxwriter

inputFile = "RE15 (4).lst"
with open(inputFile,"r",encoding='UTF-8') as f:
    lines = f.readlines()

page = 0
iteration = 0

filename = f"{inputFile}-output/iteration-{str(iteration)}/page-{str(page)}.txt"
os.makedirs(os.path.dirname(filename), exist_ok=True)
writer = open(filename,"w")
c = 0

d = {'MAHI': 2, 'SALAL_HEP': 3, 'URI_HEP': 4, 'CHAMERA_2_HEP': 5, 'BARSINGSAR_NLC': 6, 'CHAMERA_HEP': 7, 'NATHPA_JHAKRI_HEP': 8, 'DHAULIGANGA_HEP': 9, 'GIRAL_LTPS': 10, 'SASAN_UMPP': 11, 'RIHAND_3_STPS': 12, 'RIHAND_2_STPS': 13, 'RIHAND_STPS': 14, 'SINGRAULI_STPS': 15, 'PARBATI_3': 16, 'TANAKPUR_HEP': 17, 'TALA': 18, 'DB_POWER': 19, 'MCCPL': 20, 'CGPL_MUNDRA_UMPP': 21, 'CHAMERA_3_HEP': 22, 'ANTA_GAS': 23, 'DADRI_GAS': 24, 'AURAIYA_GAS': 25, 'TEHRI_HEP': 26, 'URI_2_HEP': 27, 'RAMPUR_HEP': 28, 'KOTESHWAR': 29, 'TEESTA_3': 30, 'MEJA': 31, 'RAJWEST_LTPS': 32, 'RAMGARH_GAS': 33, 'KOLDAM_HEP': 34, 'SINGRAULI_HEP': 35, 'KAWAI': 36, 'KAHALGOAN_2': 37, 'SEWA_2_HEP': 38, 'TANDA_2': 39, 'DULHASTI_HEP': 40, 'KAHALGOAN_1': 41, 'CSTPP': 42, 'FARAKKA': 43, 'KOTA_TPS': 44, 'CHABRA_TPS': 45, 'KALISINDH_1_2': 46, 'NAPP': 47, 'RAPS_A': 48, 'UNCHAHAR_4': 49, 'DADRI_2_TPS': 50, 'RAPPB': 51, 'SSCTPS_8': 52, 'SSCTPS_7': 53, 'UNCHAHAR_3': 54, 'UNCHAHAR_1': 55, 'UNCHAHAR_2': 56, 'RAPPC': 57, 'SURATGARH_TPS': 58, 'ANTA_RLNG': 59, 'AURAIYA_RLNG': 60, 'DADRI_RLNG': 61, 'AURAIYA_LIQUID': 62, 'DADRI_CRF': 63, 'AURAIYA_CRF': 64, 'ANTA_CRF': 65, 'ANTA_LIQUID': 66, 'DHOLPUR_GPS': 67, 'DADRI_LIQUID': 68, 'BIOMASS': 69, 'KARCHAM_WANGTOO_HEP.t2': 70, 'KARCHAM_WANGTOO_HEP.t3': 71, 'KARCHAM_WANGTOO_HEP.t4': 72, 'KARCHAM_WANGTOO_HEP.t5': 73, 'KARCHAM_WANGTOO_HEP.t6': 74, 'KARCHAM_WANGTOO_HEP.t7': 75, 'KARCHAM_WANGTOO_HEP.t8': 76, 'KARCHAM_WANGTOO_HEP.t9': 77, 'RTC_1': 78, 'RTC_2': 79, 'RTC_3': 80, 'mShldr_1': 81, 'mShldr_2': 82, 'mpeak_1': 83, 'mpeak_2': 84, 'mpeak_3': 85, 'Shldr_1': 86, 'Shldr_2': 87, 'epeak_1': 88, 'epeak_2': 89, 'epeak_3': 90, '----': 91, '****': 92}

for line in lines:
    # if c==250000:
    #     break
    # c+=1
    if line=="G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m\n":
        writer.close()
        if (page-3)%4==0:
            iteration+=1
        page+=1
        filename = f"{inputFile}-output/iteration-{str(iteration)}/page-{str(page)}.txt"
        os.makedirs(os.path.dirname(filename), exist_ok=True)
        writer = open(filename,"w")
    writer.writelines(line)

d = {}

filename = f"{inputFile}-output/iteration-0/page-3.txt"
writer = open(filename,"r")
lines = writer.readlines()
row = 2
for line in lines:
    if line=="\n":
        continue
    data = line.split()
    if len(data)==6:
        if data[0] not in d.keys():
            d[data[0]] = row
            row+=1
    
print(d)

page = 7
# d = {}
l = ['S_RPO_bal', 'NS_RPO_bal', 'hydpowerlim1', 'hydpowerlim2', 'Gh_Rampup', 'Gh_Rampdown', 'Eq_Risk', 'Eq1_Risk', 'Eq2_Risk', 'Eq3_Risk', 'Eq4_Risk', 'TS', 'TD', 'TW', 'TSREC', 'TNSREC', 'PV_bal', 'Wind_bal', 'TPPC1', 'TPPC2', 'Gen_cost', 'LS_cost', 'PXX_cost', 'DSM_costt', 'HGen_cost', 'S_REC_cost', 'NS_REC_co~', 'PXXDAM_co~', 'PXXRTM_co~', 'PV_Ct_cost', 'Wind_Ct_c~', 'E', 'PV_Sch', 'Wind_Sch', 'PV_Ct', 'Wind_Ct', 'DSM', 'S_REC', 'NS_REC', 'DAM', 'RTM', 'Total_sol~', 'Total_dem~', 'Total_wind', 'Total_S_R~', 'Total_NS_~', 'uh', 'Total_cost', 'Gh', 'Risk', 'Risk1', 'Risk2', 'Risk3', 'Risk4', 'Final_cost', 'Total_PPC1', 'Total_PPC2']
# l = ['Eq_Risk', 'Eq1_Risk', 'Eq2_Risk', 'Eq3_Risk', 'Eq4_Risk', 'TS', 'TD', 'TW', 'TSREC', 'TNSREC', 'PV_bal', 'Wind_bal', 'TPPC1', 'TPPC2', 'Gen_cost', 'LS_cost', 'PXX_cost', 'DSM_costt', 'S_REC_cost', 'NS_REC_co~', 'PXXDAM_co~', 'PXXRTM_co~', 'E', 'PV_Sch', 'Wind_Sch', 'PV_Ct', 'Wind_Ct', 'DSM', 'S_REC', 'NS_REC', 'DAM', 'RTM', 'Total_sol~', 'Total_dem~', 'Total_wind', 'Total_S_R~', 'Total_NS_~', 'Total_cost', 'Risk', 'Risk1', 'Risk2', 'Risk3', 'Risk4', 'Final_cost', 'Total_PPC1', 'Total_PPC2']
write = False
for i in range(1,iteration):  
    print(i)
    filename = f"{inputFile}-output/iteration-{str(i)}/page-{str(page)}.txt"
    writer = open(filename,"r")
    lines = writer.readlines()[167:]
    workbook = xlsxwriter.Workbook(f"{inputFile}-output/iteration-{str(i)}/output.xlsx")
    print(len(lines))
    for line in lines:
        if line=="\n":
            continue
        data = line.split()
        if data[0]=='----':
            # if not write and len(l)!=0:
            #     l.pop()
            if data[2] not in l:
                # continue
                worksheet = workbook.add_worksheet(data[2])
                # l.append(data[2])
                write = True
                worksheet.write(0,0,"TimeFrame")
                for key in d.keys():
                    worksheet.write(0,d[key]-1,key)
                for k in range(1,97):
                    worksheet.write(k,0,str(k))
            # else:
                # print("skipping",data[2])
            # print(line)
        if len(data)==6:
            # print(data[1])
            if data[1] in ['VAR','REPORT']:
                continue
            if '.' in data[0]:
                data[0] = data[0].split('.')[0]
            worksheet.write(int(data[1][2:4]),d[data[0]]-1,float(data[3] if data[3]!='.' else 0))
            write = False
            # if data[0] in d:
            #     continue
            # d[data[0]] = row
            # row+=1
            # print(data[0])
    # print(l)
    workbook.close()
    # print(i)
    page+=4