function sysCall_init() -- Inicializa a função sysCall_init, a função chamada ao começar a simulaão
    local robot=sim.getObject('.') -- Pega o identificador do objeto principal (robô)
    local obstacles=sim.createCollection(0) -- Cria uma coleção vazia de objetos chamada obstacles
    sim.addItemToCollection(obstacles,sim.handle_all,-1,0) -- Adiciona todos os objetos à coleção obstacles
    sim.addItemToCollection(obstacles,sim.handle_tree,robot,1) -- Remove a subárvore do robô da coleção obstacles para que o robô não detecte a si mesmo como obstáculo
    usensors={} -- Inicializa uma tabela para armazenar os sensores ultrassônicos
    for i=1,16,1 do -- Loop para configurar 16 sensores ultrassônicos
        usensors[i]=sim.getObject("./ultrasonicSensor",{index=i-1}) -- Obtém cada sensor ultrassônico e o adiciona à tabela usensors
        sim.setObjectInt32Param(usensors[i],sim.proxintparam_entity_to_detect,obstacles) -- Configura cada sensor para detectar objetos na coleção obstacles
    end -- fechamento do bloco do loop
    
    motorLeft=sim.getObject("./leftMotor")
    motorRight=sim.getObject("./rightMotor")
    -- Obtém os identificadores dos motores esquerdo e direito.

    -- Configura as distâncias para a detecção dos sensores:
    noDetectionDist=0.5 -- noDetectionDist: distância máxima para não detectar um objeto.
    maxDetectionDist=0.2 -- maxDetectionDist: distância mínima para detectar um objeto.    

    detect={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- Inicializa uma tabela para armazenar os valores de detecção dos sensores
    
    -- Coeficientes para o algoritmo de Braitenberg:
    braitenbergL={-0.2,-0.4,-0.6,-0.8,-1,-1.2,-1.4,-1.6, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0} -- braitenbergL controla o motor esquerdo com base nos valores dos sensores.
    braitenbergR={-1.6,-1.4,-1.2,-1,-0.8,-0.6,-0.4,-0.2, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0} -- braitenbergR controla o motor direito com base nos valores dos sensores.
    -- Algoritmo de Braitenberg = feito para simular comportamentos animais simples, como a busca por comida ou a fuga de predadores. Eles são controlados por um conjunto de regras simples que relacionam a entrada dos sensores com a saída dos motores
        
    v0=2 -- Define a velocidade base dos motores
end -- fechamento do bloco da função


function sysCall_cleanup() -- Inicializa a função sysCall_cleanup
 
end -- fechamento do bloco da função

function sysCall_actuation() -- Inicializa a função sysCall_actuation
    for i=1,16,1 do -- Loop para ler os sensores ultrassônicos
        res,dist=sim.readProximitySensor(usensors[i]) -- Lê o sensor de proximidade na posição i
        if (res>0) and (dist<noDetectionDist) then  -- Se um objeto é detectado dentro da noDetectionDist, calcula a intensidade da detecção.
            if (dist<maxDetectionDist) then -- Se a distância for meno que o maxDetectionDist
                dist=maxDetectionDist -- atribui maxDetectionDist à dist
            end -- fechamento do bloco de if
            detect[i]=1-((dist-maxDetectionDist)/(noDetectionDist-maxDetectionDist)) -- calcula a divisão entre a diferença de dist e maxDetectionDist, pela diferença de noDetectionDist e maxDetectionDist
        else 
            detect[i]=0 -- Caso contrário, define a detecção como 0.
        end -- fechamento do bloco de else
    end -- fechamento do bloco do loop

    vLeft=v0
    vRight=v0
    -- Inicializa as velocidades dos motores com a velocidade base
    
    for i=1,16,1 do -- Ajusta as velocidades dos motores com base nos valores de detecção e nos coeficientes de Braitenberg.
        vLeft=vLeft+braitenbergL[i]*detect[i]
        vRight=vRight+braitenbergR[i]*detect[i]
    end -- fechamento do bloco do loop
    
    sim.setJointTargetVelocity(motorLeft,vLeft)
    sim.setJointTargetVelocity(motorRight,vRight)
    -- define as velocidades dos motores esquerdo e direito com os valores calculados.
    
end -- fechamento do bloco da função
