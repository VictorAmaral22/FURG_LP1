if (sim_call_type==sim.syscb_init) then -- inicialização do script
    steer_handle= sim.getObjectHandle('steer_joint') 
    motor_handle= sim.getObjectHandle('motor_joint')
    fl_brake_handle= sim.getObjectHandle('fl_brake_joint')
    fr_brake_handle= sim.getObjectHandle('fr_brake_joint')
    bl_brake_handle= sim.getObjectHandle('bl_brake_joint')
    br_brake_handle= sim.getObjectHandle('br_brake_joint')
    -- Obtém os identificadores das juntas de direção, motor e freio.
    
    --wheel radius:         0.09
    --wheel base:             0.6
    --wheel track:             0.35
    --maximum steering rate:     70 deg/sec
    
    --the maximum steer angle 30 degree
    max_steer_angle=0.5235987 -- Define o ângulo máximo de direção (30 graus em radianos)
    --the maximum torque of the motor
    motor_torque=60 -- define o torque máximo do motor
    
    dVel=1
    dSteer=0.1
    -- Define incrementos de velocidade e direção.
    
        --input steer
    steer_angle=0
        --input velocity
    motor_velocity=dVel*10
        --input brake
    brake_force=0
    -- Inicializa os ângulos de direção, velocidade do motor e força do freio
end -- Fim do bloco de if

if (sim_call_type==sim.syscb_cleanup) then -- Esta parte do código é executada quando a simulação é finalizada (atualmente vazia)
 
end -- Fim do bloco de if

if (sim_call_type==sim.syscb_actuation) then -- Esta parte do código é executada repetidamente durante a simulação para atuar no veículo
    --current steer pos
    steer_pos=sim.getJointPosition(steer_handle); -- Obtém a posição atual da direção
    --current angular velocity of back left wheel
    bl_wheel_velocity=sim.getObjectFloatParameter(bl_brake_handle,2012)
    --current angular velocity of back right wheel
    br_wheel_velocity=sim.getObjectFloatParameter(br_brake_handle,2012)
    --average angular velocity of the back wheels
    rear_wheel_velocity=(bl_wheel_velocity+br_wheel_velocity)/2
    --linear velocity
    linear_velocity=rear_wheel_velocity*0.09 
    -- Calcula a velocidade angular das rodas traseiras e a velocidade linear do veículo
    
    
    -- Read the keyboard messages (make sure the focus is on the main window, scene view):
    message,auxiliaryData=sim.getSimulatorMessage() -- Lê as mensagens do teclado e exibe qual tecla foi pressionada

    while message~=-1 do -- Enquanto o usuário estiver digitando ...
        if (message==sim.message_keypress) then
            Msg="Tecla: "
            Msg=Msg..auxiliaryData[1]
            sim.addStatusbarMessage(Msg)

            -- Mapeia as teclas do teclado para controle do veículo
            if (auxiliaryData[1]==2007) then -- (seta para cima): aumenta a velocidade do motor
                -- up key
                if (motor_velocity<dVel*9.99) then
                    motor_velocity=motor_velocity+dVel
                end -- Fim do bloco de if
            end -- Fim do bloco de if
            if (auxiliaryData[1]==2008) then --  (seta para baixo): diminui a velocidade do motor
                -- down key
                if (motor_velocity>-dVel*1.99) then
                    motor_velocity=motor_velocity-dVel
                else
                --    brake_force=100
                end -- Fim do bloco de else
            end -- Fim do bloco de if
            if (auxiliaryData[1]==2009) then --  (seta para a esquerda): aumenta o ângulo de direção
                -- left key
                if (steer_angle<dSteer*4.99) then
                    steer_angle=steer_angle+dSteer
                end -- Fim do bloco de if
            end -- Fim do bloco de if
            if (auxiliaryData[1]==2010) then -- (seta para a direita): diminui o ângulo de direção
                -- right key
                if (steer_angle>-dSteer*4.99) then
                    steer_angle=steer_angle-dSteer
                end -- Fim do bloco de if
            end -- Fim do bloco de if
            if (auxiliaryData[1]==115) then -- (tecla 's'): para o veículo
                -- s key
                motor_velocity=0.0
            end -- Fim do bloco de if
        end -- Fim do bloco de if
        message,auxiliaryData=sim.getSimulatorMessage()
    end
    
    if (math.abs(motor_velocity)<dVel*0.1) then -- Aplica o freio se a velocidade do motor for muito baixa
        brake_force=100
    else
        brake_force=0
    end  -- Fim do bloco de else
    
        --set maximum steer angle
    if (steer_angle> max_steer_angle) then -- Garante que o ângulo de direção não exceda o máximo permitido e aplica o ângulo de direção
        steer_angle=max_steer_angle
    end -- Fim do bloco de if
    if (steer_angle< -max_steer_angle) then 
        steer_angle= -max_steer_angle
    end  -- Fim do bloco de if
    sim.setJointTargetPosition(steer_handle, steer_angle) 
    
    --brake and motor can not be applied at the same time
    if(brake_force>0) then -- Aplica força de frenagem ou torque do motor, garantindo que não sejam aplicados simultaneamente
        sim.setJointForce(motor_handle, 0)
    else
        sim.setJointForce(motor_handle, motor_torque)
        sim.setJointTargetVelocity(motor_handle, motor_velocity)
    end  -- Fim do bloco de else
    
    sim.setJointForce(fr_brake_handle, brake_force)
    sim.setJointForce(fl_brake_handle, brake_force)
    sim.setJointForce(bl_brake_handle, brake_force)
    sim.setJointForce(br_brake_handle, brake_force)
    -- Aplica a força de frenagem nas juntas de freio dianteiras e traseiras
end -- Fim do bloco de if
