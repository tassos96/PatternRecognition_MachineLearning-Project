%Name: Anastasios Antonopoulos
%A.M:  1115201400014

function targets = return_targets(fh)
    Data = textscan(fh, ['%d,%[^,],',repmat('%f,',1,29),'%f\n']);
    fclose(fh);
    n = length(Data);       % number of features + target
    n = n-2;                % ignore first two attributes (ID, target)
    P = length(Data{1});    % number of patterns
    
    t = zeros(1,P); % targets
    for pat=1:P
        if char(Data{2}(pat)) == 'M'
            t(pat) = 1; %Malignant
        else
            t(pat) = 0; %Beling
        end
    end
    targets = t;
end