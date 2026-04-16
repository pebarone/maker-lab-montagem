# Projeto: Caixa Mecânica Expansível (Lotus/Iris Box)
## Integrantes
- RM99781 - Pedro Augusto Barone
- RM551579 - João Pedro Albuquerque

Este projeto consiste numa caixa de armazenamento mecânica com um sistema de abertura síncrona, inspirada no movimento de uma flor (Lotus) ou de uma íris. A peça é totalmente produzida via impressão 3D e utiliza um sistema de engrenagens planetárias para expandir as gavetas.

---

## Componentes do Sistema

O conjunto é formado pelas seguintes partes:
* **Base com Trilho:** Estrutura inferior que suporta o mecanismo.
* **Engrenagens Planetárias:** 1 engrenagem central (sol) e 5 engrenagens periféricas (satélites).
* **Placa Intermediária de Guia:** Peça branca que esconde as engrenagens e define o percurso curvo.
* **Gavetas (Pétalas):** 5 compartimentos individuais em formato de fatia.
* **Tampa Decorativa:** Placa superior com grafismo de circuito impresso.
* **Puxador Estrela:** Peça central rosqueada (modelada em OpenSCAD) que aciona o sistema.

---

## 🔧 Processo de Montagem

### 1. Sistema de Transmissão (Base)
A montagem começa com o posicionamento das engrenagens na base. A engrenagem central é conectada ao eixo principal. As cinco engrenagens satélites são posicionadas ao redor, encaixando nos dentes da central e nos trilhos da base.
<img width="623" height="831" alt="image" src="https://github.com/user-attachments/assets/b933bdad-443c-4c9a-a530-683e84e4f4ae" />

### 2. Interface e Guias
A placa intermediária branca é colocada sobre as engrenagens. Os pinos quadrados das engrenagens satélites atravessam as fendas curvas desta placa. Estas fendas são cruciais, pois convertem o movimento circular das engrenagens num movimento radial de expansão.
<img width="831" height="623" alt="image" src="https://github.com/user-attachments/assets/68a881ba-4fe1-4ba5-a401-d5a79a488a53" />

### 3. Instalação das Gavetas
Cada pétala (gaveta) é encaixada nos pinos que sobressaem da placa intermediária. O design permite que, quando fechadas, as gavetas se unam para formar um cilindro sólido.
<img width="831" height="623" alt="image" src="https://github.com/user-attachments/assets/757fa624-1a2e-4f22-a14c-71f98e181b6f" />

Garanta que abertas, elas se pareçam com isso:

<img width="831" height="623" alt="image" src="https://github.com/user-attachments/assets/31fb9863-1711-4d12-a9c6-46778bc0b3a6" />


**Nota:** As gavetas devem ficar com o lado arredondado voltado para fora para garantir o fechamento correto e a estética do cilindro.

### 4. Finalização e Travamento
A tampa decorativa é colocada sobre as gavetas. O projeto é finalizado com o **Puxador Estrela** de 4.9cm, que é rosqueado no eixo central. Esta peça não só serve de decoração, mas funciona como a manivela principal do mecanismo.
<img width="623" height="831" alt="image" src="https://github.com/user-attachments/assets/03fbef0f-5731-4f46-a1f7-06d3298f4c57" />

---

## ⚙️ Funcionamento Mecânico

O mecanismo opera através de cinemática síncrona:
1. **Acionamento:** Ao girar a estrela superior, o utilizador rotaciona o eixo central.
2. **Transmissão:** A engrenagem central transfere o torque para as 5 engrenagens satélites.
3. **Expansão:** À medida que as engrenagens rodam, elas são forçadas a seguir o trilho curvo da placa intermediária.
4. **Abertura:** Este movimento empurra as gavetas para fora simultaneamente, revelando o conteúdo interno da caixa de forma fluida.

---

## Especificações Técnicas da Estrela Central
* **Diâmetro Total:** 49 mm (4.9 cm)
* **Espessura da Base:** 5 mm (0.5 cm)
* **Largura dos Braços:** 7.5 mm
* **Altura do Miolo:** 3.5 mm (extra)
* **Furo de Fixação:** 3 mm (inferior)

---

## Código OpenSCAD & Foto da modelagem
# Base Inferior
<img width="916" height="490" alt="image" src="https://github.com/user-attachments/assets/67636630-f868-41ba-a1a0-2d50c132b0c8" />

# Base Superior

<img width="920" height="496" alt="image" src="https://github.com/user-attachments/assets/8e0c0d23-e252-4eff-8b3f-21c5d80f8899" />


```openscad
$fn = 100;
diametro = 49;
espessura = 5;
num_pontas = 5;
largura_braco = 7.5;
comp_ponta = 4.5;
raio_centro = 5.5;
altura_miolo = 3.5;
diametro_parafuso = 3;
raio_total = diametro / 2;

module braco() {
    linear_extrude(height = espessura) {
        polygon(points=[
            [0, largura_braco/2],
            [raio_total - comp_ponta, largura_braco/2],
            [raio_total, 0],
            [raio_total - comp_ponta, -largura_braco/2],
            [0, -largura_braco/2]
        ]);
    }
}

module centro() {
    cylinder(h = espessura + altura_miolo - 1.5, r = raio_centro);
    translate([0, 0, espessura + altura_miolo - 1.5])
        scale([1, 1, 0.6]) sphere(r = raio_centro);
}

difference() {
    union() {
        for (i = [0 : num_pontas - 1]) {
            rotate([0, 0, i * (360 / num_pontas)])
                braco();
        }
        centro();
    }
    translate([0, 0, -1])
        cylinder(h = espessura + altura_miolo + 2, d = diametro_parafuso);
}
