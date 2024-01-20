library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ElectronicLock is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(15 downto 0);
           data_s : out STD_LOGIC_VECTOR(3 downto 0);
           code_sig : out STD_LOGIC_VECTOR(15 downto 0);
           ouverture : out STD_LOGIC);
end ElectronicLock;

architecture Behavioral of ElectronicLock is
    signal data_s_signal : STD_LOGIC_VECTOR(3 downto 0);
    signal code_sig_signal : STD_LOGIC_VECTOR(15 downto 0);
    signal ouverture_signal : STD_LOGIC;
    signal detect_signal : STD_LOGIC; 

    component Codeur
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR(15 downto 0);
               data_s : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component DetecteurCaractere
        Port ( data_in : in STD_LOGIC_VECTOR(15 downto 0);
               detect : out STD_LOGIC);
    end component;

    component Memory
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               detect : in STD_LOGIC;  -- Modification ici
               data_s : in STD_LOGIC_VECTOR(3 downto 0);
               code_sig : out STD_LOGIC_VECTOR(15 downto 0));
    end component;

    component Comparator_16bits
        Port ( input1 : in STD_LOGIC_VECTOR(15 downto 0);
               fixed_key : in STD_LOGIC_VECTOR(15 downto 0) := "0000010011010010"; -- 1234 en binaire
               ouverture : out STD_LOGIC);
    end component;

begin

    Codeur_Component : Codeur port map(clk, reset, data_in, data_s_signal);

    Detecteur : DetecteurCaractere port map(data_in, detect_signal);

    Memoire : Memory port map(clk, reset, detect_signal, data_s_signal, code_sig_signal);

    Comparateur : Comparator_16bits port map(code_sig_signal, "0000010011010010", ouverture_signal);

    data_s <= data_s_signal;
    code_sig <= code_sig_signal;
    ouverture <= ouverture_signal;

end Behavioral;
