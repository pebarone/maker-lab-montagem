# 📦 Projeto: Caixa Mecânica Expansível (Lotus/Iris Box)

Este projeto consiste numa caixa de armazenamento mecânica com um sistema de abertura síncrona, inspirada no movimento de uma flor (Lotus) ou de uma íris. A peça é totalmente produzida via impressão 3D e utiliza um sistema de engrenagens planetárias para expandir as gavetas.

---

## 🛠️ Componentes do Sistema

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
<img width="1247" height="1663" alt="image" src="https://github.com/user-attachments/assets/b933bdad-443c-4c9a-a530-683e84e4f4ae" />

### 2. Interface e Guias
A placa intermediária branca é colocada sobre as engrenagens. Os pinos quadrados das engrenagens satélites atravessam as fendas curvas desta placa. Estas fendas são cruciais, pois convertem o movimento circular das engrenagens num movimento radial de expansão.
<img width="1663" height="1247" alt="image" src="https://github.com/user-attachments/assets/68a881ba-4fe1-4ba5-a401-d5a79a488a53" />

### 3. Instalação das Gavetas
Cada pétala (gaveta) é encaixada nos pinos que sobressaem da placa intermediária. O design permite que, quando fechadas, as gavetas se unam para formar um cilindro sólido.
<img width="1663" height="1247" alt="image" src="https://github.com/user-attachments/assets/757fa624-1a2e-4f22-a14c-71f98e181b6f" />

Note que, gavetas devem ficar com o lado arredondado para fora

### 4. Finalização e Travamento
A tampa decorativa é colocada sobre as gavetas. O projeto é finalizado com o **Puxador Estrela** de 4.9cm, que é rosqueado no eixo central. Esta peça não só serve de decoração, mas funciona como a manivela principal do mecanismo.
<img width="1247" height="1663" alt="image" src="https://github.com/user-attachments/assets/03fbef0f-5731-4f46-a1f7-06d3298f4c57" />

---

## ⚙️ Funcionamento Mecânico

O mecanismo opera através de cinemática síncrona:
1.  **Acionamento:** Ao girar a estrela superior, o utilizador rotaciona o eixo central.
2.  **Transmissão:** A engrenagem central transfere o torque para as 5 engrenagens satélites.
3.  **Expansão:** À medida que as engrenagens rodam, elas são forçadas a seguir o trilho curvo da placa intermediária.
4.  **Abertura:** Este movimento empurra as gavetas para fora simultaneamente, revelando o conteúdo interno da caixa de forma fluida.

---

## 📐 Especificações da Peça de Controlo (Estrela)
* **Diâmetro:** 49 mm
* **Espessura:** 5 mm
* **Tipo de Encaixe:** Orifício central para parafuso/eixo rosqueado.
* **Software de Modelagem:** OpenSCAD.

---
**Nota:** Este projeto demonstra a precisão da impressão 3D em tolerâncias mecânicas, permitindo que engrenagens e eixos funcionem sem necessidade de rolamentos metálicos.
