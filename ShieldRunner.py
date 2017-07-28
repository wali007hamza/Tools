import subprocess, sys, json, re, csv

def CallShieldApi(puid, longPuid):
    print("Calling for PUID: {}, LongPuid: {}".format(puid, longPuid))
    powershellScriptPrefix = "&{. \"./Play-ShieldApi.ps1\"; & Invoke-ShieldApiRequest -Url https://ncus-000.ols.officeapps.live.com/shield/Partner/OneDrive/"
    powershellScriptSuffix = "/EntitledPlans}"
    powershellScript = powershellScriptPrefix + puid + powershellScriptSuffix
    p = subprocess.Popen(["powershell.exe", '-Command', powershellScript], stdout=subprocess.PIPE)
    out, err = p.communicate()
    return out

with open("C:\\Users\\syhamza\\desktop\\Copy of Possible Miscommunication OLS 7-27.csv") as file:
    content = file.readlines()

listOfPuids = [x.strip().split(",")[0] for x in content]

mapOfResponse = {}
for puid in listOfPuids:
    decimalRegex = re.compile(r'[^\d.]+')
    longPuid = int(decimalRegex.sub('', puid))
    hexPuid = hex(longPuid).rstrip("L").lstrip("0x").upper()
    response = CallShieldApi(hexPuid.strip(), longPuid).decode("utf-8").replace('\r','')
    response = response.replace('\n',',')
    mapOfResponse[longPuid] = response

print(mapOfResponse)

with open("C:\\Users\\syhamza\\desktop\\misscoumminication_result.csv", 'w') as output_file:
    writer = csv.writer(output_file)
    for key, value in mapOfResponse.items():
        writer.writerow([key, value])
