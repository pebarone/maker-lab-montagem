// Estrela de 5 pontas paramétrica com orifício de parafuso inferior
// Medidas baseadas na peça original: 4.9cm (49mm) x 0.5cm (5mm)

$fn = 100; // Resolução para deixar os cilindros e esferas bem suaves

// --- Parâmetros Principais ---
diametro = 49;        // Diâmetro total de ponta a ponta (em mm)
espessura = 5;        // Espessura base dos braços (em mm)
num_pontas = 5;       // Número de pontas da estrela

// --- Parâmetros de Ajuste Visual (estimados pelas fotos) ---
largura_braco = 7.5;  // Largura do corpo de cada braço
comp_ponta = 4.5;     // Comprimento do chanfro (o biquinho na ponta)
raio_centro = 5.5;    // Raio do cilindro central
altura_miolo = 3.5;   // Altura extra que o miolo passa acima dos braços

// --- Parâmetros Novos do Orifício de Parafuso ---
diametro_parafuso = 3; // Diâmetro do orifício para o parafuso (mm), adequado para M3

// Cálculo do raio total (não alterar)
raio_total = diametro / 2;

module braco() {
    // Desenha o formato 2D do braço visto de cima e extruda para 3D
    linear_extrude(height = espessura) {
        polygon(points=[
            [0, largura_braco/2],
            [raio_total - comp_ponta, largura_braco/2],
            [raio_total, 0], // Ponta extrema
            [raio_total - comp_ponta, -largura_braco/2],
            [0, -largura_braco/2]
        ]);
    }
}

module centro() {
    // Corpo do cilindro que compõe o centro
    cylinder(h = espessura + altura_miolo - 1.5, r = raio_centro);
    
    // Topo arredondado da cúpula central
    translate([0, 0, espessura + altura_miolo - 1.5])
        scale([1, 1, 0.6]) sphere(r = raio_centro);
}

// --- Montagem Final da Peça com o Orifício ---
difference() {
    // A peça estrela completa (união de braços e centro)
    union() {
        // Loop para criar e rotacionar os 5 braços
        for (i = [0 : num_pontas - 1]) {
            rotate([0, 0, i * (360 / num_pontas)])
                braco();
        }
        
        // Adiciona o miolo central
        centro();
    }

    // --- Subtrair o Orifício do Parafuso ---
    // Cria um cilindro para o orifício, centrado e ligeiramente mais alto que a peça para garantir um corte limpo
    // Ele atravessa a peça de baixo para cima.
    height_cutting = espessura + altura_miolo + 2; // Altura de corte total
    translate([0, 0, -1]) // Desloca para baixo para garantir que comece a cortar a partir da base
        cylinder(h = height_cutting, d = diametro_parafuso, center = false);
}