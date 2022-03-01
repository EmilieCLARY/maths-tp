# CLARY Emilie
# DIEU Joachim

class Sandpile():

  def __init__(self, mat):

    self.mat = matrix(mat)

  def __repr__(self):

    return self.mat.__repr__()

  def __eq__(self, other):

    return self.mat == other.mat

    
  def show(self):
    return matrix_plot(self.mat, cmap='Blues', colorbar=True, colorbar_options={'shrink':0.5})

  def topple(self, i, j):
    ligne = self.mat.nrows()
    colonne = self.mat.ncols()

    if (self.mat[i,j] >= 4):
        self.mat[i,j] -= 4 

        if i > 0:
            self.mat[i-1,j] += 1

        if j > 0:
            self.mat[i,j-1] += 1

        if i < self.mat.nrows() - 1:
            self.mat[i+1,j] += 1

        if j < self.mat.ncols() - 1:
            self.mat[i,j+1] += 1
    else:
        print("Une erreur s'est produite")

  def stabilize(self):
      toutStable = True
      compt = 0
      ligne = self.mat.nrows()
      colonne = self.mat.ncols()
      
      while (toutStable):
          toutStable = false
          for i in range(ligne):
              for j in range(colonne):
                  if (self.mat[(i,j)] >= 4):
                      toutStable = True
                      compt += 1
                      self.topple(i,j)
      print("Stabilisation après "+str(compt)+" tupples.")

  def mat21(self, valeur_centrale): 
    ligne = self.mat.nrows()
    colonne = self.mat.ncols()

    for i in range(ligne) :
        for j in range(colonne) :
            if(i == 10 and j == 10) :
                self.mat[i, j] = 100
            else :
                self.mat[i, j] = 2
    self.mat[((ligne-1)/2),((colonne-1)/2)] = valeur_centrale

  def __add__(self, other):
    mat2 = matrix(other.mat.nrows())
    
    for i in range (0,other.mat.nrows()):
        for j in range (0,other.mat.ncols()):
            mat2[i,j] = self.mat[i,j] + other.mat[i,j]
    s = Sandpile(mat2)
    s.stabilize()
    return s
  
def id_sandpile(n):
  s_max = Sandpile(3*ones_matrix(n))
  double = s_max + s_max
  t = Sandpile([[3 - double.mat[i,j] for j in range(n)] for i in range(n)])
  return s_max + t
  
print("-= Classe Sandpile chargée =-")
print()
print("N'oubliez pas de la recharger à chaque fois que vous la modifiez !")