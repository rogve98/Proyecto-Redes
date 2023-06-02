using DataFrames
using CSV

datos = DataFrame(CSV.File("Establecimientoseconomicos.csv"))

colores = datos[!,3]
prueba = copy(colores)
for i in 1:629
    if prueba[i] == 434211
        prueba[i] = 1
    end
end

for i in 1:629
    if prueba[i] == 434221
        prueba[i] = 2
    end
end


for i in 1:629
    if prueba[i] == 434311
        prueba[i] = 3
    end
end

for i in 1:629
    if prueba[i] ==  434224
        prueba[i] = 4
    end
end

for i in 1:629
    if prueba[i] ==  435313
        prueba[i] = 5
    end
end

for i in 1:629
    if prueba[i] ==  435312
        prueba[i] = 6
    end
end

for i in 1:629
    if prueba[i] ==  434225
        prueba[i] = 7
    end
end

for i in 1:629
    if prueba[i] ==  431110
        prueba[i] = 8
    end
end

for i in 1:629
    if prueba[i] ==  431191
        prueba[i] = 9
    end
end

for i in 1:629
    if prueba[i] ==  435419
        prueba[i] = 10
    end
end

for i in 1:629
    if prueba[i] ==  434226
        prueba[i] = 11
    end
end

for i in 1:629
    if prueba[i] ==  435319
        prueba[i] = 12
    end
end

for i in 1:629
    if prueba[i] ==  467115
        prueba[i] = 13
    end
end

for i in 1:629
    if prueba[i] ==  466112
        prueba[i] = 14
    end
end

for i in 1:629
    if prueba[i] ==  464112
        prueba[i] = 15
    end
end

for i in 1:629
    if prueba[i] ==  461110
        prueba[i] = 16
    end
end

for i in 1:629
    if prueba[i] ==  467112
        prueba[i] = 17
    end
end

for i in 1:629
    if prueba[i] ==  467111
        prueba[i] = 18
    end
end

for i in 1:629
    if prueba[i] ==  466212
        prueba[i] = 19
    end
end

for i in 1:629
    if prueba[i] ==  465911
        prueba[i] = 20
    end
end

for i in 1:629
    if prueba[i] ==  468211
        prueba[i] = 21
    end
end

for i in 1:629
    if prueba[i] ==  461213
        prueba[i] = 22
    end
end

for i in 1:629
    if prueba[i] ==  461122
        prueba[i] = 23
    end
end

for i in 1:629
    if prueba[i] ==  466319
        prueba[i] = 24
    end
end

for i in 1:629
    if prueba[i] ==  467114
        prueba[i] = 25
    end
end

for i in 1:629
    if prueba[i] ==  463216
        prueba[i] = 26
    end
end

for i in 1:629
    if prueba[i] ==  465912
        prueba[i] = 27
    end
end

for i in 1:629
    if prueba[i] ==  465913
        prueba[i] = 28
    end
end

for i in 1:629
    if prueba[i] ==  466410
        prueba[i] = 29
    end
end

for i in 1:629
    if prueba[i] ==  463112
        prueba[i] = 30
    end
end

for i in 1:629
    if prueba[i] ==  463212
        prueba[i] = 31
    end
end

for i in 1:629
    if prueba[i] ==  463211
        prueba[i] = 32
    end
end

for i in 1:629
    if prueba[i] ==  461130
        prueba[i] = 33
    end
end

for i in 1:629
    if prueba[i] ==  461140
        prueba[i] = 34
    end
end

for i in 1:629
    if prueba[i] ==  462111
        prueba[i] = 35
    end
end

for i in 1:629
    if prueba[i] ==  463113
        prueba[i] = 36
    end
end

for i in 1:629
    if prueba[i] ==  463213
        prueba[i] = 37
    end
end

for i in 1:629
    if prueba[i] ==  466312
        prueba[i] = 38
    end
end

for i in 1:629
    if prueba[i] ==  461190
        prueba[i] = 39
    end
end

for i in 1:629
    if prueba[i] ==  465919
        prueba[i] = 40
    end
end

for i in 1:629
    if prueba[i] ==  461121
        prueba[i] = 41
    end
end

for i in 1:629
    if prueba[i] ==  461160
        prueba[i] = 42
    end
end

for i in 1:629
    if prueba[i] ==  461212
        prueba[i] = 43
    end
end

for i in 1:629
    if prueba[i] ==  466111
        prueba[i] = 44
    end
end

for i in 1:629
    if prueba[i] ==  465111
        prueba[i] = 45
    end
end

for i in 1:629
    if prueba[i] ==  465312
        prueba[i] = 46
    end
end

for i in 1:629
    if prueba[i] ==  467113
        prueba[i] = 47
    end
end

for i in 1:629
    if prueba[i] ==  465112
        prueba[i] = 48
    end
end

for i in 1:629
    if prueba[i] ==  465212
        prueba[i] = 49
    end
end

for i in 1:629
    if prueba[i] ==  461150
        prueba[i] = 50
    end
end

for i in 1:629
    if prueba[i] ==  466114
        prueba[i] = 51
    end
end

for i in 1:629
    if prueba[i] ==  465215
        prueba[i] = 52
    end
end

for i in 1:629
    if prueba[i] ==  465915
        prueba[i] = 53
    end
end

for i in 1:629
    if prueba[i] ==  466311
        prueba[i] = 54
    end
end

for i in 1:629
    if prueba[i] ==  464111
        prueba[i] = 55
    end
end

for i in 1:629
    if prueba[i] ==  468411
        prueba[i] = 56
    end
end

for i in 1:629
    if prueba[i] ==  464113
        prueba[i] = 57
    end
end

for i in 1:629
    if prueba[i] ==  463310
        prueba[i] = 58
    end
end

for i in 1:629
    if prueba[i] ==  462112
        prueba[i] = 59
    end
end

for i in 1:629
    if prueba[i] ==  466314
        prueba[i] = 60
    end
end

for i in 1:629
    if prueba[i] ==  466314
        prueba[i] = 61
    end
end

for i in 1:629
    if prueba[i] ==  461211
        prueba[i] = 62
    end
end

for i in 1:629
    if prueba[i] ==  461170
        prueba[i] = 63
    end
end

for i in 1:629
    if prueba[i] ==  465914
        prueba[i] = 64
    end
end

for i in 1:629
    if prueba[i] ==  468311
        prueba[i] = 65
    end
end

for i in 1:629
    if prueba[i] ==  462210
        prueba[i] = 66
    end
end

for i in 1:629
    if prueba[i] ==  464121
        prueba[i] = 67
    end
end

for i in 1:629
    if prueba[i] ==  465311
        prueba[i] = 68
    end
end

for i in 1:629
    if prueba[i] ==  465313
        prueba[i] = 69
    end
end

for i in 1:629
    if prueba[i] ==  461123
        prueba[i] = 70
    end
end

for i in 1:629
    if prueba[i] ==  468420
        prueba[i] = 71
    end
end

for i in 1:629
    if prueba[i] ==  468213
        prueba[i] = 72
    end
end

for i in 1:629
    if prueba[i] ==  463111
        prueba[i] = 73
    end
end

for i in 1:629
    if prueba[i] ==  463215
        prueba[i] = 74
    end
end

for i in 1:629
    if prueba[i] ==  465211
        prueba[i] = 75
    end
end

prueba